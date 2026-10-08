from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(
    r"products",
    views.ProductViewSet,
    basename="product"
)

router.register(
    r"categories",
    views.CategoryViewSet,
    basename="category"
)

urlpatterns = [
    path("", views.home, name="home"),

    path(
    "verify-payment/",
    views.verify_payment,
    name="verify_payment"
    ),

    path(
        "product/<int:product_id>/",
        views.product_detail,
        name="product_detail"
    ),

    path(
        "cart/add/<int:product_id>/",
        views.add_to_cart,
        name="add_to_cart"
    ),

    path(
        "cart/",
        views.cart,
        name="cart"
    ),

    path(
        "cart/remove/<int:product_id>/",
        views.remove_from_cart,
        name="remove_from_cart"
    ),

    path(
    "checkout/",
    views.checkout,
    name="checkout"
),

path(
    "order-success/<int:order_id>/",
    views.order_success,
    name="order_success"
),

path(
    "orders/",
    views.my_orders,
    name="my_orders"
),

path(
    "wishlist/add/<int:product_id>/",
    views.add_to_wishlist,
    name="add_to_wishlist"
),

path(
    "wishlist/",
    views.wishlist,
    name="wishlist"
),

path(
    "wishlist/remove/<int:product_id>/",
    views.remove_from_wishlist,
    name="remove_from_wishlist"
),

    path(
    "register/",
    views.register,
    name="register"
),

path(
    "login/",
    views.user_login,
    name="login"
),

path(
    "logout/",
    views.user_logout,
    name="logout"
),

path(
    "api/",
    include(router.urls)
),
]
