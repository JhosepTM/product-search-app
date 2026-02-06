// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordsModel<T> {

 List<T> get data; PaginationInfoModel get pagination;
/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordsModelCopyWith<T, RecordsModel<T>> get copyWith => _$RecordsModelCopyWithImpl<T, RecordsModel<T>>(this as RecordsModel<T>, _$identity);

  /// Serializes this RecordsModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordsModel<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'RecordsModel<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $RecordsModelCopyWith<T,$Res>  {
  factory $RecordsModelCopyWith(RecordsModel<T> value, $Res Function(RecordsModel<T>) _then) = _$RecordsModelCopyWithImpl;
@useResult
$Res call({
 List<T> data, PaginationInfoModel pagination
});


$PaginationInfoModelCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RecordsModelCopyWithImpl<T,$Res>
    implements $RecordsModelCopyWith<T, $Res> {
  _$RecordsModelCopyWithImpl(this._self, this._then);

  final RecordsModel<T> _self;
  final $Res Function(RecordsModel<T>) _then;

/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfoModel,
  ));
}
/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoModelCopyWith<$Res> get pagination {
  
  return $PaginationInfoModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecordsModel].
extension RecordsModelPatterns<T> on RecordsModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordsModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordsModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _RecordsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordsModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _RecordsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  PaginationInfoModel pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordsModel() when $default != null:
return $default(_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  PaginationInfoModel pagination)  $default,) {final _that = this;
switch (_that) {
case _RecordsModel():
return $default(_that.data,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  PaginationInfoModel pagination)?  $default,) {final _that = this;
switch (_that) {
case _RecordsModel() when $default != null:
return $default(_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _RecordsModel<T> implements RecordsModel<T> {
  const _RecordsModel({required final  List<T> data, required this.pagination}): _data = data;
  factory _RecordsModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$RecordsModelFromJson(json,fromJsonT);

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationInfoModel pagination;

/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordsModelCopyWith<T, _RecordsModel<T>> get copyWith => __$RecordsModelCopyWithImpl<T, _RecordsModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$RecordsModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordsModel<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'RecordsModel<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$RecordsModelCopyWith<T,$Res> implements $RecordsModelCopyWith<T, $Res> {
  factory _$RecordsModelCopyWith(_RecordsModel<T> value, $Res Function(_RecordsModel<T>) _then) = __$RecordsModelCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, PaginationInfoModel pagination
});


@override $PaginationInfoModelCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RecordsModelCopyWithImpl<T,$Res>
    implements _$RecordsModelCopyWith<T, $Res> {
  __$RecordsModelCopyWithImpl(this._self, this._then);

  final _RecordsModel<T> _self;
  final $Res Function(_RecordsModel<T>) _then;

/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_RecordsModel<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfoModel,
  ));
}

/// Create a copy of RecordsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoModelCopyWith<$Res> get pagination {
  
  return $PaginationInfoModelCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$PaginationInfoModel {

 int get limit; int get offset; int get total; int get page; int get totalPages; bool get hasNextPage; bool get hasPreviousPage;
/// Create a copy of PaginationInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationInfoModelCopyWith<PaginationInfoModel> get copyWith => _$PaginationInfoModelCopyWithImpl<PaginationInfoModel>(this as PaginationInfoModel, _$identity);

  /// Serializes this PaginationInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationInfoModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,page,totalPages,hasNextPage,hasPreviousPage);

@override
String toString() {
  return 'PaginationInfoModel(limit: $limit, offset: $offset, total: $total, page: $page, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
}


}

/// @nodoc
abstract mixin class $PaginationInfoModelCopyWith<$Res>  {
  factory $PaginationInfoModelCopyWith(PaginationInfoModel value, $Res Function(PaginationInfoModel) _then) = _$PaginationInfoModelCopyWithImpl;
@useResult
$Res call({
 int limit, int offset, int total, int page, int totalPages, bool hasNextPage, bool hasPreviousPage
});




}
/// @nodoc
class _$PaginationInfoModelCopyWithImpl<$Res>
    implements $PaginationInfoModelCopyWith<$Res> {
  _$PaginationInfoModelCopyWithImpl(this._self, this._then);

  final PaginationInfoModel _self;
  final $Res Function(PaginationInfoModel) _then;

/// Create a copy of PaginationInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? offset = null,Object? total = null,Object? page = null,Object? totalPages = null,Object? hasNextPage = null,Object? hasPreviousPage = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationInfoModel].
extension PaginationInfoModelPatterns on PaginationInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginationInfoModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int offset,  int total,  int page,  int totalPages,  bool hasNextPage,  bool hasPreviousPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationInfoModel() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.page,_that.totalPages,_that.hasNextPage,_that.hasPreviousPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int offset,  int total,  int page,  int totalPages,  bool hasNextPage,  bool hasPreviousPage)  $default,) {final _that = this;
switch (_that) {
case _PaginationInfoModel():
return $default(_that.limit,_that.offset,_that.total,_that.page,_that.totalPages,_that.hasNextPage,_that.hasPreviousPage);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int offset,  int total,  int page,  int totalPages,  bool hasNextPage,  bool hasPreviousPage)?  $default,) {final _that = this;
switch (_that) {
case _PaginationInfoModel() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.page,_that.totalPages,_that.hasNextPage,_that.hasPreviousPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationInfoModel implements PaginationInfoModel {
  const _PaginationInfoModel({this.limit = 0, this.offset = 0, this.total = 0, this.page = 0, this.totalPages = 0, this.hasNextPage = false, this.hasPreviousPage = false});
  factory _PaginationInfoModel.fromJson(Map<String, dynamic> json) => _$PaginationInfoModelFromJson(json);

@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  bool hasPreviousPage;

/// Create a copy of PaginationInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationInfoModelCopyWith<_PaginationInfoModel> get copyWith => __$PaginationInfoModelCopyWithImpl<_PaginationInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationInfoModel&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,page,totalPages,hasNextPage,hasPreviousPage);

@override
String toString() {
  return 'PaginationInfoModel(limit: $limit, offset: $offset, total: $total, page: $page, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationInfoModelCopyWith<$Res> implements $PaginationInfoModelCopyWith<$Res> {
  factory _$PaginationInfoModelCopyWith(_PaginationInfoModel value, $Res Function(_PaginationInfoModel) _then) = __$PaginationInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int limit, int offset, int total, int page, int totalPages, bool hasNextPage, bool hasPreviousPage
});




}
/// @nodoc
class __$PaginationInfoModelCopyWithImpl<$Res>
    implements _$PaginationInfoModelCopyWith<$Res> {
  __$PaginationInfoModelCopyWithImpl(this._self, this._then);

  final _PaginationInfoModel _self;
  final $Res Function(_PaginationInfoModel) _then;

/// Create a copy of PaginationInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = null,Object? total = null,Object? page = null,Object? totalPages = null,Object? hasNextPage = null,Object? hasPreviousPage = null,}) {
  return _then(_PaginationInfoModel(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
