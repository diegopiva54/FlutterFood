import 'dart:convert';

class Restaurant {
  String identify;
  String name;
  String image;
  String contact;

  Restaurant({this.identify, this.name, this.image, this.contact});

  factory Restaurant.fromJson(jsonData) {
    return Restaurant(
      identify: jsonData['identify'],
      name: jsonData['name'],
      image: jsonData['logo'],
      contact: jsonData['contact'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'name': name,
      'image': image,
      'contact': contact,
    });
  }
}
