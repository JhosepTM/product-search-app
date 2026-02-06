// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchProducts value)?  fetchProducts,TResult Function( _UpdateProductPrice value)?  updateProductPrice,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _UpdateProductPrice() when updateProductPrice != null:
return updateProductPrice(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchProducts value)  fetchProducts,required TResult Function( _UpdateProductPrice value)  updateProductPrice,}){
final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts(_that);case _UpdateProductPrice():
return updateProductPrice(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchProducts value)?  fetchProducts,TResult? Function( _UpdateProductPrice value)?  updateProductPrice,}){
final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that);case _UpdateProductPrice() when updateProductPrice != null:
return updateProductPrice(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int page,  int limit)?  fetchProducts,TResult Function( int productId,  double newPrice,  String currency)?  updateProductPrice,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that.page,_that.limit);case _UpdateProductPrice() when updateProductPrice != null:
return updateProductPrice(_that.productId,_that.newPrice,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int page,  int limit)  fetchProducts,required TResult Function( int productId,  double newPrice,  String currency)  updateProductPrice,}) {final _that = this;
switch (_that) {
case _FetchProducts():
return fetchProducts(_that.page,_that.limit);case _UpdateProductPrice():
return updateProductPrice(_that.productId,_that.newPrice,_that.currency);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int page,  int limit)?  fetchProducts,TResult? Function( int productId,  double newPrice,  String currency)?  updateProductPrice,}) {final _that = this;
switch (_that) {
case _FetchProducts() when fetchProducts != null:
return fetchProducts(_that.page,_that.limit);case _UpdateProductPrice() when updateProductPrice != null:
return updateProductPrice(_that.productId,_that.newPrice,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _FetchProducts implements ProductEvent {
  const _FetchProducts({this.page = 1, this.limit = 10});
  

@JsonKey() final  int page;
@JsonKey() final  int limit;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchProductsCopyWith<_FetchProducts> get copyWith => __$FetchProductsCopyWithImpl<_FetchProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchProducts&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,page,limit);

@override
String toString() {
  return 'ProductEvent.fetchProducts(page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$FetchProductsCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$FetchProductsCopyWith(_FetchProducts value, $Res Function(_FetchProducts) _then) = __$FetchProductsCopyWithImpl;
@useResult
$Res call({
 int page, int limit
});




}
/// @nodoc
class __$FetchProductsCopyWithImpl<$Res>
    implements _$FetchProductsCopyWith<$Res> {
  __$FetchProductsCopyWithImpl(this._self, this._then);

  final _FetchProducts _self;
  final $Res Function(_FetchProducts) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,Object? limit = null,}) {
  return _then(_FetchProducts(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateProductPrice implements ProductEvent {
  const _UpdateProductPrice({required this.productId, required this.newPrice, required this.currency});
  

 final  int productId;
 final  double newPrice;
 final  String currency;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProductPriceCopyWith<_UpdateProductPrice> get copyWith => __$UpdateProductPriceCopyWithImpl<_UpdateProductPrice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProductPrice&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.newPrice, newPrice) || other.newPrice == newPrice)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,productId,newPrice,currency);

@override
String toString() {
  return 'ProductEvent.updateProductPrice(productId: $productId, newPrice: $newPrice, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$UpdateProductPriceCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory _$UpdateProductPriceCopyWith(_UpdateProductPrice value, $Res Function(_UpdateProductPrice) _then) = __$UpdateProductPriceCopyWithImpl;
@useResult
$Res call({
 int productId, double newPrice, String currency
});




}
/// @nodoc
class __$UpdateProductPriceCopyWithImpl<$Res>
    implements _$UpdateProductPriceCopyWith<$Res> {
  __$UpdateProductPriceCopyWithImpl(this._self, this._then);

  final _UpdateProductPrice _self;
  final $Res Function(_UpdateProductPrice) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? newPrice = null,Object? currency = null,}) {
  return _then(_UpdateProductPrice(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,newPrice: null == newPrice ? _self.newPrice : newPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductState {

 ProductStatus get status;@JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson) RecordsEntity<ProductEntity> get records;@JsonKey(includeFromJson: false, includeToJson: false) Failure? get failure;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);

  /// Serializes this ProductState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.records, records) || other.records == records)&&(identical(other.failure, failure) || other.failure == failure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,records,failure);

@override
String toString() {
  return 'ProductState(status: $status, records: $records, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 ProductStatus status,@JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson) RecordsEntity<ProductEntity> records,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure
});


$RecordsEntityCopyWith<ProductEntity, $Res> get records;

}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? records = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as RecordsEntity<ProductEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecordsEntityCopyWith<ProductEntity, $Res> get records {
  
  return $RecordsEntityCopyWith<ProductEntity, $Res>(_self.records, (value) {
    return _then(_self.copyWith(records: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductState value)  $default,){
final _that = this;
switch (_that) {
case _ProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductStatus status, @JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson)  RecordsEntity<ProductEntity> records, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.status,_that.records,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductStatus status, @JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson)  RecordsEntity<ProductEntity> records, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _ProductState():
return $default(_that.status,_that.records,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductStatus status, @JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson)  RecordsEntity<ProductEntity> records, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.status,_that.records,_that.failure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductState implements ProductState {
  const _ProductState({this.status = ProductStatus.NONE, @JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson) this.records = const RecordsEntity<ProductEntity>(data: [], pagination: PaginationInfoEntity()), @JsonKey(includeFromJson: false, includeToJson: false) this.failure = null});
  factory _ProductState.fromJson(Map<String, dynamic> json) => _$ProductStateFromJson(json);

@override@JsonKey() final  ProductStatus status;
@override@JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson) final  RecordsEntity<ProductEntity> records;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Failure? failure;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateCopyWith<_ProductState> get copyWith => __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductState&&(identical(other.status, status) || other.status == status)&&(identical(other.records, records) || other.records == records)&&(identical(other.failure, failure) || other.failure == failure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,records,failure);

@override
String toString() {
  return 'ProductState(status: $status, records: $records, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(_ProductState value, $Res Function(_ProductState) _then) = __$ProductStateCopyWithImpl;
@override @useResult
$Res call({
 ProductStatus status,@JsonKey(fromJson: _recordsFromJson, toJson: _recordsToJson) RecordsEntity<ProductEntity> records,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure
});


@override $RecordsEntityCopyWith<ProductEntity, $Res> get records;

}
/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? records = null,Object? failure = freezed,}) {
  return _then(_ProductState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as RecordsEntity<ProductEntity>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecordsEntityCopyWith<ProductEntity, $Res> get records {
  
  return $RecordsEntityCopyWith<ProductEntity, $Res>(_self.records, (value) {
    return _then(_self.copyWith(records: value));
  });
}
}

// dart format on
