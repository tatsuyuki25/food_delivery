class FakeRestaurantRepository {

}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
  });
  final String id;
  final String name;
  final String description;
  final String image;
  final double rating;
}