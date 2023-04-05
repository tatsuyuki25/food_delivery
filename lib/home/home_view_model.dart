import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_view_model.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<Restaurant> restaurants,
  }) = _HomeState;
}

class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({FakeRestaurantRepository? restaurantRepository})
      : _restaurantRepository =
            restaurantRepository ?? FakeRestaurantRepository(),
        super(const HomeState(restaurants: []));

  final FakeRestaurantRepository _restaurantRepository;

  Future<void> getRestaurants() async {
    final restaurants = await _restaurantRepository.getRestaurants();
    state = state.copyWith(restaurants: restaurants);
  }
}
