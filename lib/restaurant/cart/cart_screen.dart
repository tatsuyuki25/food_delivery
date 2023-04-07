import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:go_router/go_router.dart';

/// 購物車頁
///
/// 顯示購物車內容，並提供結帳按鈕
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({required this.restaurant, required this.cart, super.key});

  final Restaurant restaurant;
  final Map<Meal, int> cart;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),
      body: ListView(
        children: [
          ...widget.cart.entries.map((entry) {
            final meal = entry.key;
            final count = entry.value;
            return ListTile(
              title: Text(meal.name),
              subtitle: Text('x$count'),
              trailing: Text('\$${meal.price * count}'),
              leading: Image.network(meal.image, fit: BoxFit.cover),
            );
          }),
          const Divider(),
          ListTile(
            title: const Text('總共'),
            trailing: Text(
              '\$${widget.cart.entries.fold<int>(0, (previousValue, entry) {
                final meal = entry.key;
                final count = entry.value;
                return previousValue + (meal.price * count);
              })}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('返回'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  // context.go('/checkout');
                },
                child: const Text('結帳'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
