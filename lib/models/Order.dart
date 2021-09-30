import 'dart:convert';

import './Food.dart';
import './Evaluation.dart';

class Order {
  String identify;
  String date_created;
  String status;
  double total;
  String comment;
  List<Food> foods;
  List<Evaluation> evaluations;

  Order(
      {this.identify,
      this.date_created,
      this.status,
      this.total,
      this.comment,
      this.foods,
      this.evaluations});

  factory Order.fromJson(jsonData) {
    List<Food> _foodsApi = (jsonData['products'] as List)
        .map((food) => Food.fromJson(food))
        .toList();

    List<Evaluation> _evaluationsApi = (jsonData['evaluations'] as List)
        .map((evaluations) => Evaluation.fromJson(evaluations))
        .toList();

    return Order(
      identify: jsonData['identify'],
      date_created: jsonData['date'],
      status: jsonData['status'],
      total: double.parse(jsonData['total'].toString()),
      comment: jsonData['comment'],
      foods: _foodsApi,
      evaluations: _evaluationsApi,
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'date ': date_created,
      'status': status,
      'total': total,
      'comment': comment,
      'foods': foods,
      'evaluations': evaluations,
    });
  }
}
