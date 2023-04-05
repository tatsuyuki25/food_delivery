import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/home/home_view_model.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:food_delivery/route.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({HomeViewModel? model, super.key})
      : model = model ?? HomeViewModel();

  final HomeViewModel model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final _provider =
      StateNotifierProvider<HomeViewModel, HomeState>((ref) => widget.model);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_provider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('餐廳'),
      ),
      body: ListView.builder(
        itemCount: state.restaurants.length,
        itemBuilder: (context, index) => RestaurantItem(
            restaurant: state.restaurants[index],
            onTap: () => _onItemTap(state.restaurants[index])),
      ),
    );
  }

  /// 初始化
  Future<void> _init() async {
    await ref.read(_provider.notifier).getRestaurants();
  }

  void _onItemTap(Restaurant restaurant) {
    context.pushNamed(Routes.restaurantDetail, extra: restaurant);
  }
}

/// 餐廳Item
class RestaurantItem extends StatelessWidget {
  RestaurantItem({required this.restaurant, required this.onTap, super.key});

  /// 餐廳
  final Restaurant restaurant;
  final NumberFormat _ratingFormat = NumberFormat('#.0');

  /// 點擊事件
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.network(
              restaurant.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(restaurant.name),
                  Text('${_ratingFormat.format(restaurant.rating)}/5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
