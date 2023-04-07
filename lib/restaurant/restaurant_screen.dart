import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:food_delivery/restaurant/restaurant_view_model.dart';
import 'package:food_delivery/route.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  RestaurantScreen(
      {required this.restaurant, RestaurantViewModel? model, super.key})
      : model = model ?? RestaurantViewModel();

  final Restaurant restaurant;

  final RestaurantViewModel model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final NumberFormat _ratingFormat = NumberFormat('#.0');
  late final restaurant = widget.restaurant;

  late final _provider =
      StateNotifierProvider<RestaurantViewModel, RestaurantState>(
          (ref) => widget.model);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final group = ref.watch(_provider).mealGroups;
    final cart = ref.watch(_provider).cart;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text(restaurant.name),
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    restaurant.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ];
        },
        body: Builder(builder: (context) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverToBoxAdapter(
                        child: Row(
                          children: [
                            Text(restaurant.name,
                                style: Theme.of(context).textTheme.titleLarge),
                            const Spacer(),
                            Text(
                                '${_ratingFormat.format(restaurant.rating)}/5'),
                          ],
                        ),
                      ),
                      const SliverToBoxAdapter(child: Gap(16)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: group.length,
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: MealGroupItem(
                                group: group[index],
                                onTap: _onTapMeal,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 下方購物車按鈕區域，如果購物車沒有東西就不顯示，上方顯示陰影
              if (cart.isNotEmpty)
                Container(
                  height: 100,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, -4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: ElevatedButton(
                      onPressed: _goToCart, child: Text('購物車(${cart.length})')),
                ),
            ],
          );
        }),
      ),
    );
  }

  /// 初始化
  Future<void> _init() async {
    await ref.read(_provider.notifier).getMealGroups(restaurant);
  }

  /// 點擊顯示BottomSheet加入購物車，並且有+/-來增減數量，最少為1
  Future<void> _onTapMeal(Meal meal) async {
    final count = await showModalBottomSheet<int>(
        context: context,
        builder: (context) {
          return MealBottomSheet(meal: meal);
        });
    if (count != null) {
      ref.read(_provider.notifier).addToCart(meal, count);
    }
  }

  /// 前往購物車頁面
  void _goToCart() {
    context.pushNamed(Routes.cart, extra: {
      'restaurant': restaurant,
      'cart': ref.read(_provider).cart,
    });
  }
}

/// 加入購物車的BottomSheet
class MealBottomSheet extends StatefulWidget {
  const MealBottomSheet({required this.meal, super.key});

  final Meal meal;

  @override
  State<MealBottomSheet> createState() => _MealBottomSheetState();
}

class _MealBottomSheetState extends State<MealBottomSheet> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          MealItem(meal: widget.meal),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
              Text('$count'),
              IconButton(onPressed: increment, icon: const Icon(Icons.add)),
            ],
          ),
          const Gap(16),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(count),
              child: const Text('加入購物車'))
        ],
      ),
    );
  }

  /// 增加數量
  void increment() {
    setState(() {
      count++;
    });
  }

  /// 減少數量
  void decrement() {
    if (count == 1) return;
    setState(() {
      count--;
    });
  }
}

/// 顯示餐點的Widget
class MealGroupItem extends StatelessWidget {
  const MealGroupItem({required this.group, required this.onTap, super.key});

  final MealGroup group;
  final void Function(Meal meal) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.name, style: Theme.of(context).textTheme.titleMedium),
        const Gap(8),
        Column(
          children: [
            for (final meal in group.items)
              InkWell(onTap: () => onTap(meal), child: MealItem(meal: meal)),
          ],
        )
      ],
    );
  }
}

/// 顯示餐點的Widget
class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Image.network(
            meal.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const Gap(16),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal.name, style: Theme.of(context).textTheme.bodyLarge),
              Text('${meal.price} \$',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ))
        ],
      ),
    );
  }
}
