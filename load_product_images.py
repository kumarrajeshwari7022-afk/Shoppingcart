import os
import zipfile
import shutil

import django


# --------------------------------------------------
# 1. Setup Django
# --------------------------------------------------

os.environ.setdefault(
    "DJANGO_SETTINGS_MODULE",
    "ecommerce.settings"
)

django.setup()


# --------------------------------------------------
# 2. Import Product model
# --------------------------------------------------

from shop.models import Product


# --------------------------------------------------
# 3. File locations
# --------------------------------------------------

BASE_DIR = os.path.dirname(
    os.path.abspath(__file__)
)

ZIP_FILE = os.path.join(
    BASE_DIR,
    "ecommerce_product_images.zip"
)

MEDIA_DIR = os.path.join(
    BASE_DIR,
    "media"
)

PRODUCTS_DIR = os.path.join(
    MEDIA_DIR,
    "products"
)

EXTRACT_DIR = os.path.join(
    BASE_DIR,
    "temp_product_images"
)


# --------------------------------------------------
# 4. Check ZIP exists
# --------------------------------------------------

if not os.path.exists(ZIP_FILE):
    print("ERROR: ecommerce_product_images.zip was not found.")
    print("Make sure the ZIP is inside the project folder.")
    exit()


# --------------------------------------------------
# 5. Create folders
# --------------------------------------------------

os.makedirs(PRODUCTS_DIR, exist_ok=True)

os.makedirs(EXTRACT_DIR, exist_ok=True)


# --------------------------------------------------
# 6. Extract ZIP
# --------------------------------------------------

print("Extracting product images...")

with zipfile.ZipFile(ZIP_FILE, "r") as zip_ref:
    zip_ref.extractall(EXTRACT_DIR)


# --------------------------------------------------
# 7. Create image lookup
# --------------------------------------------------

image_files = {}

for root, dirs, files in os.walk(EXTRACT_DIR):

    for file in files:

        if file.lower().endswith(
            (".png", ".jpg", ".jpeg", ".webp")
        ):

            image_files[file.lower()] = os.path.join(
                root,
                file
            )


# --------------------------------------------------
# 8. Product → image filename mapping
# --------------------------------------------------

product_images = {

    # Electronics
    "Wireless Headphones":
        "wireless_headphones.png",

    "Smartphone":
        "smartphone.png",

    "Laptop":
        "laptop.png",

    "Bluetooth Speaker":
        "bluetooth_speaker.png",

    "Wireless Mouse":
        "wireless_mouse.png",

    "Mechanical Keyboard":
        "mechanical_keyboard.png",

    "Smart Watch":
        "smart_watch.png",

    "USB-C Charger":
        "usb_c_charger.png",

    "Power Bank":
        "power_bank.png",

    "Webcam":
        "webcam.png",


    # Clothing
    "Cotton T-Shirt":
        "cotton_t_shirt.png",

    "Denim Jeans":
        "denim_jeans.png",

    "Hoodie":
        "hoodie.png",

    "Formal Shirt":
        "formal_shirt.png",

    "Casual Jacket":
        "casual_jacket.png",

    "Sports T-Shirt":
        "sports_t_shirt.png",

    "Track Pants":
        "track_pants.png",

    "Kurti":
        "kurti.png",


    # Books
    "Python Programming Book":
        "python_programming_book.png",

    "Machine Learning Basics":
        "machine_learning_basics.png",

    "Deep Learning with Python":
        "deep_learning_with_python.png",

    "Data Structures and Algorithms":
        "data_structures_and_algorithms.png",

    "Web Development Guide":
        "web_development_guide.png",

    "Artificial Intelligence Fundamentals":
        "artificial_intelligence_fundamentals.png",

    "Django for Beginners":
        "django_for_beginners.png",


    # Home & Kitchen
    "Electric Kettle":
        "electric_kettle.png",

    "Mixer Grinder":
        "mixer_grinder.png",

    "Water Bottle":
        "water_bottle.png",

    "Coffee Mug":
        "coffee_mug.png",

    "Lunch Box":
        "lunch_box.png",

    "Table Lamp":
        "table_lamp.png",

    "Non-Stick Frying Pan":
        "non_stick_frying_pan.png",

    "Storage Container Set":
        "storage_container_set.png",
}


# --------------------------------------------------
# 9. Assign images to products
# --------------------------------------------------

success_count = 0
missing_count = 0

print("\nStarting product image assignment...\n")


for product_name, image_name in product_images.items():

    try:

        product = Product.objects.get(
            name=product_name
        )

    except Product.DoesNotExist:

        print(
            f"NOT FOUND IN DATABASE: {product_name}"
        )

        missing_count += 1

        continue


    image_source = image_files.get(
        image_name.lower()
    )


    if not image_source:

        print(
            f"IMAGE NOT FOUND: {image_name}"
        )

        missing_count += 1

        continue


    # Destination filename
    destination = os.path.join(
        PRODUCTS_DIR,
        image_name
    )


    # Copy image
    shutil.copy2(
        image_source,
        destination
    )


    # Update Django ImageField
    product.image.name = (
        f"products/{image_name}"
    )

    product.save(
        update_fields=["image"]
    )


    print(
        f"SUCCESS: {product_name} "
        f"-> {image_name}"
    )

    success_count += 1


# --------------------------------------------------
# 10. Final result
# --------------------------------------------------

print("\n--------------------------------")
print("IMAGE UPLOAD COMPLETED")
print("--------------------------------")

print(
    f"Successfully assigned: {success_count}"
)

print(
    f"Missing: {missing_count}"
)

print(
    f"Images stored in: {PRODUCTS_DIR}"
)

print("--------------------------------")