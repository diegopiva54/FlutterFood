import 'dart:convert';

class Food {
  String name;
  String identify;
  String description;
  double price;
  String image;

  Food({this.name, this.identify, this.description, this.price, this.image});

  factory Food.fromJson(jsonData) {
    return Food(
      name: jsonData['name'],
      identify: jsonData['identify'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }

  toJson() {
    return jsonEncode({
      'name ': name,
      'identify': identify,
      'description': description,
      'price': price,
      'image': image,
    });
  }
}
