import 'dart:convert';

import 'package:flutter/services.dart';

class FakeRestaurantRepository {
  /// 取得餐廳列表
  Future<List<Restaurant>> getRestaurants() async {
    final response = await rootBundle.loadString('assets/restaurant.json');
    return jsonDecode(response)
        .map((e) => Restaurant.fromJson(e))
        .cast<Restaurant>()
        .toList();
  }

  /// 取得餐廳菜單
  Future<List<MealGroup>> getMeals(int restaurantId) async {
    final response = await rootBundle.loadString('assets/items.json');
    return jsonDecode(response)
        .map((e) => MealGroup.fromJson(e))
        .cast<MealGroup>()
        .toList();
  }
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.address,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });
  Restaurant.fromJson(dynamic json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        description = json['description'] ?? '',
        image = json['image'] ?? '',
        address = json['address'] ?? '',
        rating = json['rating'] ?? 0.0,
        latitude = json['latitude'] ?? -999,
        longitude = json['longitude'] ?? -999;
  
  /// 餐廳ID
  final int id;

  /// 餐廳名稱
  final String name;

  /// 餐廳描述
  final String description;

  /// 餐廳圖片
  final String image;

  /// 餐廳地址
  final String address;

  /// 餐廳評分
  final double rating;

  /// 餐廳緯度
  final double latitude;

  /// 餐廳經度
  final double longitude;
}


/// 餐點群組
class MealGroup {
  MealGroup({
    required this.name,
    required this.items,
  });
  MealGroup.fromJson(dynamic json)
      : name = json['name'] ?? '',
        items = json['items'].map((e) => Meal.fromJson(e)).cast<Meal>().toList();
  
  /// 餐點群組名稱
  final String name;

  /// 餐點群組內容
  final List<Meal> items;
}


/// 餐點
class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
  Meal.fromJson(dynamic json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        image = json['image'] ?? '',
        price = json['price'] ?? 0;

  /// 餐點ID
  final int id;

  /// 餐點名稱
  final String name;

  /// 餐點圖片
  final String image;

  /// 餐點價格
  final int price;
}
