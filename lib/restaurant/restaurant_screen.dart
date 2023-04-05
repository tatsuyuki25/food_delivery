import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:food_delivery/restaurant/restaurant_view_model.dart';
import 'package:gap/gap.dart';
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(restaurant.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      const Spacer(),
                      Text('${_ratingFormat.format(restaurant.rating)}/5'),
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
          );
        }),
      ),
    );
  }

  /// 初始化
  Future<void> _init() async {
    await ref.read(_provider.notifier).getMealGroups(restaurant);
  }

  Future<void> _onTapMeal(Meal meal) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(meal.name),
            content: Text('${meal.price} \$'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('取消')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('加入購物車')),
            ],
          );
        });
  }
}

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
