import 'dart:convert';

class Food {
  String identify;
  String name;
  String description;
  double price;
  String image;

  Food({this.identify, this.name, this.description, this.price, this.image});

  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      name: jsonData['name '],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'name ': name,
      'description': description,
      'price': price,
      'image': image,
    });
  }
}
