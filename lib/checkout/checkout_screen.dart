import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/checkout/checkout_view_model.dart';
import 'package:food_delivery/repository/restaurant_repository.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// 訂單頁，顯示訂單資訊以及地圖(店家及客戶位置)
class CheckoutScreen extends ConsumerStatefulWidget {
  CheckoutScreen(
      {required this.restaurant,
      required this.cart,
      CheckoutViewModel? model,
      super.key})
      : model = model ?? CheckoutViewModel();

  final Restaurant restaurant;
  final Map<Meal, int> cart;

  final CheckoutViewModel model;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  late final restaurant = widget.restaurant;
  late final cart = widget.cart;

  late final _provider =
      StateNotifierProvider<CheckoutViewModel, CheckoutState>(
          (ref) => widget.model);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late final _initPosition = CameraPosition(
    target: LatLng(restaurant.latitude, restaurant.longitude),
    zoom: 13.5,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('訂單'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('店家: ${restaurant.name}'),
            Text('地址: ${restaurant.address}'),
            Text(
                '總金額: ${cart.entries.map((e) => e.key.price * e.value).reduce((value, element) => value + element)}'),
            Text(
                '訂單內容: ${cart.entries.map((e) => '${e.key.name} x ${e.value}').join(', ')}'),
            const Gap(16),
            // 顯示Google地圖
            if (ref.watch(_provider).hasMapPermission)
              SizedBox(
                height: 300,
                child: GoogleMap(
                    initialCameraPosition: _initPosition,
                    myLocationEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('restaurant'),
                        position:
                            LatLng(restaurant.latitude, restaurant.longitude),
                        infoWindow: const InfoWindow(title: '店家'),
                      ),
                    }),
              )
          ],
        ),
      ),
    );
  }

  /// 初始化
  Future<void> init() async {
    await ref.read(_provider.notifier).init();
  }
}
