class FakeRestaurantRepository {}

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
  final String id;
  final String name;
  final String description;
  final String image;
  final String address;
  final double rating;
  final double latitude;
  final double longitude;
}

class MealGroup {
  MealGroup({
    required this.name,
    required this.items,
  });
  MealGroup.fromJson(dynamic json)
      : name = json['name'] ?? '',
        items = (json['items'] as List).map((e) => Meal.fromJson(e)).toList();
  final String name;
  final List<Meal> items;
}

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
  final int id;
  final String name;
  final String image;
  final int price;
}
