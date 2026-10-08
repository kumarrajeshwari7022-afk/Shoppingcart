from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from .models import Product, Category, Order, OrderItem, Wishlist
from rest_framework import viewsets
from .permissions import IsAdminOrReadOnly
from .serializers import ProductSerializer, CategorySerializer
from rest_framework.pagination import PageNumberPagination
from django.db.models import Q
from django.conf import settings
from django.http import JsonResponse
from django.views.decorators.http import require_POST

import razorpay


def home(request):
    products = Product.objects.filter(available=True)
    categories = Category.objects.all()

    search_query = request.GET.get("search", "")
    category_id = request.GET.get("category", "")

    if search_query:
        products = products.filter(name__icontains=search_query)

    if category_id:
        products = products.filter(category_id=category_id)

    context = {
        "products": products,
        "categories": categories,
        "search_query": search_query,
        "selected_category": category_id,
    }

    return render(request, "shop/home.html", context)


def product_detail(request, product_id):
    product = get_object_or_404(
        Product,
        id=product_id,
        available=True
    )

    return render(
        request,
        "shop/product_detail.html",
        {"product": product}
    )


def add_to_cart(request, product_id):
    product = get_object_or_404(
        Product,
        id=product_id,
        available=True
    )

    cart = request.session.get("cart", {})

    product_id_str = str(product_id)

    if product_id_str in cart:
        cart[product_id_str] += 1
    else:
        cart[product_id_str] = 1

    request.session["cart"] = cart
    request.session.modified = True

    return redirect("cart")


def cart(request):
    cart_data = request.session.get("cart", {})

    cart_items = []
    total = 0

    for product_id, quantity in cart_data.items():

        product = get_object_or_404(
            Product,
            id=product_id,
            available=True
        )

        item_total = product.price * quantity
        total += item_total

        cart_items.append({
            "product": product,
            "quantity": quantity,
            "item_total": item_total,
        })

    context = {
        "cart_items": cart_items,
        "total": total,
    }

    return render(request, "shop/cart.html", context)


def remove_from_cart(request, product_id):

    cart = request.session.get("cart", {})

    product_id_str = str(product_id)

    if product_id_str in cart:
        del cart[product_id_str]

    request.session["cart"] = cart
    request.session.modified = True

    return redirect("cart")
def register(request):

    if request.method == "POST":

        username = request.POST.get("username")
        email = request.POST.get("email")
        password = request.POST.get("password")
        confirm_password = request.POST.get("confirm_password")

        if password != confirm_password:

            messages.error(
                request,
                "Passwords do not match."
            )

            return redirect("register")

        if User.objects.filter(username=username).exists():

            messages.error(
                request,
                "Username already exists."
            )

            return redirect("register")

        user = User.objects.create_user(
            username=username,
            email=email,
            password=password
        )

        messages.success(
            request,
            "Account created successfully. Please login."
        )

        return redirect("login")

    return render(request, "shop/register.html")


def user_login(request):

    if request.method == "POST":

        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(
            request,
            username=username,
            password=password
        )

        if user is not None:

            login(request, user)

            return redirect("home")

        messages.error(
            request,
            "Invalid username or password."
        )

    return render(request, "shop/login.html")


def user_logout(request):

    logout(request)

    messages.success(
        request,
        "You have been logged out."
    )

    return redirect("home")
@login_required
def checkout(request):

    cart_data = request.session.get("cart", {})

    if not cart_data:
        messages.error(request, "Your cart is empty.")
        return redirect("cart")

    cart_items = []
    total = 0

    for product_id, quantity in cart_data.items():

        product = get_object_or_404(
            Product,
            id=product_id,
            available=True
        )

        # Check stock
        if quantity > product.stock:
            messages.error(
                request,
                f"Only {product.stock} units of {product.name} are available."
            )
            return redirect("cart")

        item_total = product.price * quantity
        total += item_total

        cart_items.append({
            "product": product,
            "quantity": quantity,
            "item_total": item_total,
        })

    # Create order + Razorpay order
    if request.method == "POST":

        full_name = request.POST.get("full_name")
        email = request.POST.get("email")
        phone = request.POST.get("phone")
        address = request.POST.get("address")
        city = request.POST.get("city")
        state = request.POST.get("state")
        pincode = request.POST.get("pincode")

        if not all([
            full_name,
            email,
            phone,
            address,
            city,
            state,
            pincode
        ]):
            messages.error(
                request,
                "Please fill in all the required fields."
            )

            return redirect("checkout")

        # Create Django Order
        order = Order.objects.create(
            user=request.user,
            full_name=full_name,
            email=email,
            phone=phone,
            address=address,
            city=city,
            state=state,
            pincode=pincode,
            total_amount=total,
            status="Pending",
            payment_status="Pending"
        )

        # Create Order Items
        for item in cart_items:

            OrderItem.objects.create(
                order=order,
                product=item["product"],
                quantity=item["quantity"],
                price=item["product"].price
            )

        # Create Razorpay client
        client = razorpay.Client(
            auth=(
                settings.RAZORPAY_KEY_ID,
                settings.RAZORPAY_KEY_SECRET
            )
        )

        # Razorpay amount must be in paise
        razorpay_amount = int(total * 100)

        razorpay_order = client.order.create({
            "amount": razorpay_amount,
            "currency": "INR",
            "receipt": f"order_{order.id}",
            "payment_capture": 1
        })

        # Save Razorpay order ID
        order.razorpay_order_id = razorpay_order["id"]
        order.save()

        context = {
            "cart_items": cart_items,
            "total": total,
            "order": order,
            "razorpay_order_id": razorpay_order["id"],
            "razorpay_key_id": settings.RAZORPAY_KEY_ID,
            "razorpay_amount": razorpay_amount,
        }

        return render(
            request,
            "shop/checkout.html",
            context
        )

    context = {
        "cart_items": cart_items,
        "total": total,
    }

    return render(
        request,
        "shop/checkout.html",
        context
    )

@login_required
def order_success(request, order_id):

    order = get_object_or_404(
        Order,
        id=order_id,
        user=request.user
    )

    return render(
        request,
        "shop/order_success.html",
        {"order": order}
    )


@login_required
def my_orders(request):

    orders = Order.objects.filter(
        user=request.user
    ).order_by("-created_at")

    return render(
        request,
        "shop/my_orders.html",
        {"orders": orders}
    )

@login_required
def add_to_wishlist(request, product_id):

    product = get_object_or_404(
        Product,
        id=product_id,
        available=True
    )

    wishlist_item, created = Wishlist.objects.get_or_create(
        user=request.user,
        product=product
    )

    if created:
        messages.success(
            request,
            f"{product.name} added to your wishlist."
        )
    else:
        messages.info(
            request,
            f"{product.name} is already in your wishlist."
        )

    return redirect("home")


@login_required
def wishlist(request):

    wishlist_items = Wishlist.objects.filter(
        user=request.user
    ).select_related("product")

    return render(
        request,
        "shop/wishlist.html",
        {
            "wishlist_items": wishlist_items
        }
    )


@login_required
def remove_from_wishlist(request, product_id):

    Wishlist.objects.filter(
        user=request.user,
        product_id=product_id
    ).delete()

    messages.success(
        request,
        "Product removed from wishlist."
    )

    return redirect("wishlist")

class ProductPagination(PageNumberPagination):

    page_size = 6

    page_size_query_param = "page_size"

    max_page_size = 20

class ProductViewSet(viewsets.ModelViewSet):

    serializer_class = ProductSerializer

    permission_classes = [IsAdminOrReadOnly]

    pagination_class = ProductPagination

    def get_queryset(self):

        queryset = Product.objects.all().order_by("-created_at")

        search = self.request.query_params.get("search")

        category = self.request.query_params.get("category")

        if search:

            queryset = queryset.filter(
                Q(name__icontains=search) |
                Q(description__icontains=search)
            )

        if category:

            queryset = queryset.filter(
                category_id=category
            )

        return queryset


class CategoryViewSet(viewsets.ModelViewSet):

    serializer_class = CategorySerializer

    permission_classes = [IsAdminOrReadOnly]

    queryset = Category.objects.all().order_by("name")

@require_POST
@login_required
def verify_payment(request):

    payment_id = request.POST.get("razorpay_payment_id")
    razorpay_order_id = request.POST.get("razorpay_order_id")
    signature = request.POST.get("razorpay_signature")

    if not payment_id or not razorpay_order_id or not signature:
        return JsonResponse({
            "success": False,
            "message": "Payment information is incomplete."
        }, status=400)

    try:
        order = get_object_or_404(
            Order,
            razorpay_order_id=razorpay_order_id,
            user=request.user
        )

        # Prevent processing the same payment twice
        if order.payment_status == "Paid":
            return JsonResponse({
                "success": True,
                "message": "Payment already verified.",
                "redirect_url": f"/order-success/{order.id}/"
            })

        client = razorpay.Client(
            auth=(
                settings.RAZORPAY_KEY_ID,
                settings.RAZORPAY_KEY_SECRET
            )
        )

        # Verify Razorpay payment signature
        client.utility.verify_payment_signature({
            "razorpay_payment_id": payment_id,
            "razorpay_order_id": razorpay_order_id,
            "razorpay_signature": signature
        })

        # Payment is verified
        with transaction.atomic():

            order = Order.objects.select_for_update().get(
                id=order.id
            )

            order.payment_status = "Paid"
            order.status = "Confirmed"
            order.razorpay_payment_id = payment_id
            order.save()

            # Reduce stock only after successful payment
            for item in order.items.select_related("product"):

                product = Product.objects.select_for_update().get(
                    id=item.product.id
                )

                if item.quantity > product.stock:
                    return JsonResponse({
                        "success": False,
                        "message": (
                            f"Insufficient stock for {product.name}."
                        )
                    }, status=400)

                product.stock -= item.quantity

                if product.stock == 0:
                    product.available = False

                product.save()

        # Clear shopping cart after successful payment
        request.session["cart"] = {}
        request.session.modified = True

        return JsonResponse({
            "success": True,
            "message": "Payment verified successfully.",
            "redirect_url": f"/order-success/{order.id}/"
        })

    except Exception as e:

        return JsonResponse({
            "success": False,
            "message": "Payment verification failed."
        }, status=400)