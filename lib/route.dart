import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/checkout/checkout_screen.dart';
import 'package:food_delivery/home/home_screen.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:food_delivery/restaurant/cart/cart_screen.dart';
import 'package:food_delivery/restaurant/restaurant_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  /// 首頁
  static const String home = '/';

  /// 餐廳詳情頁
  static const String restaurantDetail = '/restaurantDetail';

  /// 購物車頁
  static const String cart = 'cart';

  /// 結帳頁
  static const String checkout = 'checkout';
}

/// 路由生成器
final kRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
          path: Routes.home,
          name: Routes.home,
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: Routes.checkout,
              name: Routes.checkout,
              builder: (context, state) {
                final data = state.extra as Map<String, dynamic>;
                return CheckoutScreen(
                  restaurant: data['restaurant'] as Restaurant,
                  cart: data['cart'] as Map<Meal, int>,
                );
              },
            ),
          ]),
      GoRoute(
        path: Routes.restaurantDetail,
        name: Routes.restaurantDetail,
        builder: (context, state) => RestaurantScreen(
          restaurant: state.extra as Restaurant,
        ),
        routes: [
          GoRoute(
            path: Routes.cart,
            name: Routes.cart,
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return CartScreen(
                restaurant: data['restaurant'] as Restaurant,
                cart: data['cart'] as Map<Meal, int>,
              );
            },
          ),
        ],
      ),
    ],
  );
});
