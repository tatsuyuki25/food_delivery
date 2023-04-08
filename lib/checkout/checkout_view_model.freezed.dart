// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutState {
  bool get hasMapPermission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call({bool hasMapPermission});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasMapPermission = null,
  }) {
    return _then(_value.copyWith(
      hasMapPermission: null == hasMapPermission
          ? _value.hasMapPermission
          : hasMapPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_CheckoutStateCopyWith(
          _$_CheckoutState value, $Res Function(_$_CheckoutState) then) =
      __$$_CheckoutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasMapPermission});
}

/// @nodoc
class __$$_CheckoutStateCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$_CheckoutState>
    implements _$$_CheckoutStateCopyWith<$Res> {
  __$$_CheckoutStateCopyWithImpl(
      _$_CheckoutState _value, $Res Function(_$_CheckoutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasMapPermission = null,
  }) {
    return _then(_$_CheckoutState(
      hasMapPermission: null == hasMapPermission
          ? _value.hasMapPermission
          : hasMapPermission // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CheckoutState implements _CheckoutState {
  const _$_CheckoutState({required this.hasMapPermission});

  @override
  final bool hasMapPermission;

  @override
  String toString() {
    return 'CheckoutState(hasMapPermission: $hasMapPermission)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutState &&
            (identical(other.hasMapPermission, hasMapPermission) ||
                other.hasMapPermission == hasMapPermission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasMapPermission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      __$$_CheckoutStateCopyWithImpl<_$_CheckoutState>(this, _$identity);
}

abstract class _CheckoutState implements CheckoutState {
  const factory _CheckoutState({required final bool hasMapPermission}) =
      _$_CheckoutState;

  @override
  bool get hasMapPermission;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}
