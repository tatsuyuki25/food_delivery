import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_view_model.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    required List<MealGroup> mealGroups,
  }) = _RestaurantState;
}

class RestaurantViewModel extends StateNotifier<RestaurantState> {
  RestaurantViewModel({FakeRestaurantRepository? restaurantRepository})
      : _restaurantRepository =
            restaurantRepository ?? FakeRestaurantRepository(),
        super(const RestaurantState(mealGroups: []));

  final FakeRestaurantRepository _restaurantRepository;

  Future<void> getMealGroups(Restaurant restaurant) async {
    final mealGroups = await _restaurantRepository.getMeals(restaurant.id);
    state = state.copyWith(mealGroups: mealGroups);
  }
}
