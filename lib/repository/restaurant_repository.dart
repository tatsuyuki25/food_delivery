class FakeRestaurantRepository {

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
  final String id;
  final String name;
  final String description;
  final String image;
  final String address;
  final double rating;
  final double latitude;
  final double longitude;
}