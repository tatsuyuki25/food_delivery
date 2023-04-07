import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_view_model.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    required List<MealGroup> mealGroups,
    required Map<Meal, int> cart,
  }) = _RestaurantState;
}

class RestaurantViewModel extends StateNotifier<RestaurantState> {
  RestaurantViewModel({FakeRestaurantRepository? restaurantRepository})
      : _restaurantRepository =
            restaurantRepository ?? FakeRestaurantRepository(),
        super(const RestaurantState(
          mealGroups: [],
          cart: {},
        ));

  final FakeRestaurantRepository _restaurantRepository;

  Future<void> getMealGroups(Restaurant restaurant) async {
    final mealGroups = await _restaurantRepository.getMeals(restaurant.id);
    state = state.copyWith(mealGroups: mealGroups);
  }

  /// 加入購物車
  void addToCart(Meal meal, int count) {
    final cart = Map.of(state.cart);
    cart[meal] = count;
    state = state.copyWith(cart: cart);
  }
}
