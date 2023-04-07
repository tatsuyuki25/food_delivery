// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestaurantState {
  List<MealGroup> get mealGroups => throw _privateConstructorUsedError;
  Map<Meal, int> get cart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
  @useResult
  $Res call({List<MealGroup> mealGroups, Map<Meal, int> cart});
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealGroups = null,
    Object? cart = null,
  }) {
    return _then(_value.copyWith(
      mealGroups: null == mealGroups
          ? _value.mealGroups
          : mealGroups // ignore: cast_nullable_to_non_nullable
              as List<MealGroup>,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Map<Meal, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantStateCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$_RestaurantStateCopyWith(
          _$_RestaurantState value, $Res Function(_$_RestaurantState) then) =
      __$$_RestaurantStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MealGroup> mealGroups, Map<Meal, int> cart});
}

/// @nodoc
class __$$_RestaurantStateCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$_RestaurantState>
    implements _$$_RestaurantStateCopyWith<$Res> {
  __$$_RestaurantStateCopyWithImpl(
      _$_RestaurantState _value, $Res Function(_$_RestaurantState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealGroups = null,
    Object? cart = null,
  }) {
    return _then(_$_RestaurantState(
      mealGroups: null == mealGroups
          ? _value._mealGroups
          : mealGroups // ignore: cast_nullable_to_non_nullable
              as List<MealGroup>,
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Map<Meal, int>,
    ));
  }
}

/// @nodoc

class _$_RestaurantState implements _RestaurantState {
  const _$_RestaurantState(
      {required final List<MealGroup> mealGroups,
      required final Map<Meal, int> cart})
      : _mealGroups = mealGroups,
        _cart = cart;

  final List<MealGroup> _mealGroups;
  @override
  List<MealGroup> get mealGroups {
    if (_mealGroups is EqualUnmodifiableListView) return _mealGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealGroups);
  }

  final Map<Meal, int> _cart;
  @override
  Map<Meal, int> get cart {
    if (_cart is EqualUnmodifiableMapView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_cart);
  }

  @override
  String toString() {
    return 'RestaurantState(mealGroups: $mealGroups, cart: $cart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantState &&
            const DeepCollectionEquality()
                .equals(other._mealGroups, _mealGroups) &&
            const DeepCollectionEquality().equals(other._cart, _cart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mealGroups),
      const DeepCollectionEquality().hash(_cart));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      __$$_RestaurantStateCopyWithImpl<_$_RestaurantState>(this, _$identity);
}

abstract class _RestaurantState implements RestaurantState {
  const factory _RestaurantState(
      {required final List<MealGroup> mealGroups,
      required final Map<Meal, int> cart}) = _$_RestaurantState;

  @override
  List<MealGroup> get mealGroups;
  @override
  Map<Meal, int> get cart;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}
