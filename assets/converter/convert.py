import base64

with open("assets/converter/data.txt", "r") as file:
    data = file.read()

image_data = base64.b64decode(data)

with open(f"assets/aaa.png", "wb") as image_file:
    image_file.write(image_data)

print("Image saved as aaa.png")