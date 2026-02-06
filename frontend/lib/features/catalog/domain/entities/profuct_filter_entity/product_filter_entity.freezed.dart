// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductFilterEntity {

 String? get sortBy; bool? get sortDescending; bool? get inStock; String? get currency; double? get minPrice; double? get maxPrice; String? get search;
/// Create a copy of ProductFilterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFilterEntityCopyWith<ProductFilterEntity> get copyWith => _$ProductFilterEntityCopyWithImpl<ProductFilterEntity>(this as ProductFilterEntity, _$identity);

  /// Serializes this ProductFilterEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFilterEntity&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDescending, sortDescending) || other.sortDescending == sortDescending)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.search, search) || other.search == search));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortBy,sortDescending,inStock,currency,minPrice,maxPrice,search);

@override
String toString() {
  return 'ProductFilterEntity(sortBy: $sortBy, sortDescending: $sortDescending, inStock: $inStock, currency: $currency, minPrice: $minPrice, maxPrice: $maxPrice, search: $search)';
}


}

/// @nodoc
abstract mixin class $ProductFilterEntityCopyWith<$Res>  {
  factory $ProductFilterEntityCopyWith(ProductFilterEntity value, $Res Function(ProductFilterEntity) _then) = _$ProductFilterEntityCopyWithImpl;
@useResult
$Res call({
 String? sortBy, bool? sortDescending, bool? inStock, String? currency, double? minPrice, double? maxPrice, String? search
});




}
/// @nodoc
class _$ProductFilterEntityCopyWithImpl<$Res>
    implements $ProductFilterEntityCopyWith<$Res> {
  _$ProductFilterEntityCopyWithImpl(this._self, this._then);

  final ProductFilterEntity _self;
  final $Res Function(ProductFilterEntity) _then;

/// Create a copy of ProductFilterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortBy = freezed,Object? sortDescending = freezed,Object? inStock = freezed,Object? currency = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? search = freezed,}) {
  return _then(_self.copyWith(
sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDescending: freezed == sortDescending ? _self.sortDescending : sortDescending // ignore: cast_nullable_to_non_nullable
as bool?,inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFilterEntity].
extension ProductFilterEntityPatterns on ProductFilterEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFilterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFilterEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFilterEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProductFilterEntity():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFilterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFilterEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sortBy,  bool? sortDescending,  bool? inStock,  String? currency,  double? minPrice,  double? maxPrice,  String? search)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFilterEntity() when $default != null:
return $default(_that.sortBy,_that.sortDescending,_that.inStock,_that.currency,_that.minPrice,_that.maxPrice,_that.search);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sortBy,  bool? sortDescending,  bool? inStock,  String? currency,  double? minPrice,  double? maxPrice,  String? search)  $default,) {final _that = this;
switch (_that) {
case _ProductFilterEntity():
return $default(_that.sortBy,_that.sortDescending,_that.inStock,_that.currency,_that.minPrice,_that.maxPrice,_that.search);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sortBy,  bool? sortDescending,  bool? inStock,  String? currency,  double? minPrice,  double? maxPrice,  String? search)?  $default,) {final _that = this;
switch (_that) {
case _ProductFilterEntity() when $default != null:
return $default(_that.sortBy,_that.sortDescending,_that.inStock,_that.currency,_that.minPrice,_that.maxPrice,_that.search);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductFilterEntity implements ProductFilterEntity {
  const _ProductFilterEntity({this.sortBy = null, this.sortDescending = null, this.inStock = null, this.currency = null, this.minPrice = null, this.maxPrice = null, this.search = null});
  factory _ProductFilterEntity.fromJson(Map<String, dynamic> json) => _$ProductFilterEntityFromJson(json);

@override@JsonKey() final  String? sortBy;
@override@JsonKey() final  bool? sortDescending;
@override@JsonKey() final  bool? inStock;
@override@JsonKey() final  String? currency;
@override@JsonKey() final  double? minPrice;
@override@JsonKey() final  double? maxPrice;
@override@JsonKey() final  String? search;

/// Create a copy of ProductFilterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFilterEntityCopyWith<_ProductFilterEntity> get copyWith => __$ProductFilterEntityCopyWithImpl<_ProductFilterEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductFilterEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFilterEntity&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDescending, sortDescending) || other.sortDescending == sortDescending)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.search, search) || other.search == search));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortBy,sortDescending,inStock,currency,minPrice,maxPrice,search);

@override
String toString() {
  return 'ProductFilterEntity(sortBy: $sortBy, sortDescending: $sortDescending, inStock: $inStock, currency: $currency, minPrice: $minPrice, maxPrice: $maxPrice, search: $search)';
}


}

/// @nodoc
abstract mixin class _$ProductFilterEntityCopyWith<$Res> implements $ProductFilterEntityCopyWith<$Res> {
  factory _$ProductFilterEntityCopyWith(_ProductFilterEntity value, $Res Function(_ProductFilterEntity) _then) = __$ProductFilterEntityCopyWithImpl;
@override @useResult
$Res call({
 String? sortBy, bool? sortDescending, bool? inStock, String? currency, double? minPrice, double? maxPrice, String? search
});




}
/// @nodoc
class __$ProductFilterEntityCopyWithImpl<$Res>
    implements _$ProductFilterEntityCopyWith<$Res> {
  __$ProductFilterEntityCopyWithImpl(this._self, this._then);

  final _ProductFilterEntity _self;
  final $Res Function(_ProductFilterEntity) _then;

/// Create a copy of ProductFilterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortBy = freezed,Object? sortDescending = freezed,Object? inStock = freezed,Object? currency = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? search = freezed,}) {
  return _then(_ProductFilterEntity(
sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDescending: freezed == sortDescending ? _self.sortDescending : sortDescending // ignore: cast_nullable_to_non_nullable
as bool?,inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
