
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'checkout_view_model.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    required bool hasMapPermission,
  }) = _CheckoutState;
}

/// 訂單頁
class CheckoutViewModel extends StateNotifier<CheckoutState> {
  CheckoutViewModel() : super(const CheckoutState(hasMapPermission: false));

  Future<void> init() async {
    final status = await Permission.locationWhenInUse.status;
    state = state.copyWith(hasMapPermission: status.isGranted);
  }
}