// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'records_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecordsEntity<T> {

 List<T> get data; PaginationInfoEntity get pagination;
/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordsEntityCopyWith<T, RecordsEntity<T>> get copyWith => _$RecordsEntityCopyWithImpl<T, RecordsEntity<T>>(this as RecordsEntity<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordsEntity<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'RecordsEntity<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $RecordsEntityCopyWith<T,$Res>  {
  factory $RecordsEntityCopyWith(RecordsEntity<T> value, $Res Function(RecordsEntity<T>) _then) = _$RecordsEntityCopyWithImpl;
@useResult
$Res call({
 List<T> data, PaginationInfoEntity pagination
});


$PaginationInfoEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RecordsEntityCopyWithImpl<T,$Res>
    implements $RecordsEntityCopyWith<T, $Res> {
  _$RecordsEntityCopyWithImpl(this._self, this._then);

  final RecordsEntity<T> _self;
  final $Res Function(RecordsEntity<T>) _then;

/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfoEntity,
  ));
}
/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoEntityCopyWith<$Res> get pagination {
  
  return $PaginationInfoEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecordsEntity].
extension RecordsEntityPatterns<T> on RecordsEntity<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordsEntity<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordsEntity<T> value)  $default,){
final _that = this;
switch (_that) {
case _RecordsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordsEntity<T> value)?  $default,){
final _that = this;
switch (_that) {
case _RecordsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> data,  PaginationInfoEntity pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordsEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> data,  PaginationInfoEntity pagination)  $default,) {final _that = this;
switch (_that) {
case _RecordsEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> data,  PaginationInfoEntity pagination)?  $default,) {final _that = this;
switch (_that) {
case _RecordsEntity() when $default != null:
return $default(_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _RecordsEntity<T> implements RecordsEntity<T> {
  const _RecordsEntity({required final  List<T> data, required this.pagination}): _data = data;
  

 final  List<T> _data;
@override List<T> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationInfoEntity pagination;

/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordsEntityCopyWith<T, _RecordsEntity<T>> get copyWith => __$RecordsEntityCopyWithImpl<T, _RecordsEntity<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordsEntity<T>&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'RecordsEntity<$T>(data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$RecordsEntityCopyWith<T,$Res> implements $RecordsEntityCopyWith<T, $Res> {
  factory _$RecordsEntityCopyWith(_RecordsEntity<T> value, $Res Function(_RecordsEntity<T>) _then) = __$RecordsEntityCopyWithImpl;
@override @useResult
$Res call({
 List<T> data, PaginationInfoEntity pagination
});


@override $PaginationInfoEntityCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RecordsEntityCopyWithImpl<T,$Res>
    implements _$RecordsEntityCopyWith<T, $Res> {
  __$RecordsEntityCopyWithImpl(this._self, this._then);

  final _RecordsEntity<T> _self;
  final $Res Function(_RecordsEntity<T>) _then;

/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? pagination = null,}) {
  return _then(_RecordsEntity<T>(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<T>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationInfoEntity,
  ));
}

/// Create a copy of RecordsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationInfoEntityCopyWith<$Res> get pagination {
  
  return $PaginationInfoEntityCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

/// @nodoc
mixin _$PaginationInfoEntity {

 int get limit; int get offset; int get total; int get page; int get totalPages; bool get hasNextPage; bool get hasPreviousPage;
/// Create a copy of PaginationInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationInfoEntityCopyWith<PaginationInfoEntity> get copyWith => _$PaginationInfoEntityCopyWithImpl<PaginationInfoEntity>(this as PaginationInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationInfoEntity&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage));
}


@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,page,totalPages,hasNextPage,hasPreviousPage);

@override
String toString() {
  return 'PaginationInfoEntity(limit: $limit, offset: $offset, total: $total, page: $page, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
}


}

/// @nodoc
abstract mixin class $PaginationInfoEntityCopyWith<$Res>  {
  factory $PaginationInfoEntityCopyWith(PaginationInfoEntity value, $Res Function(PaginationInfoEntity) _then) = _$PaginationInfoEntityCopyWithImpl;
@useResult
$Res call({
 int limit, int offset, int total, int page, int totalPages, bool hasNextPage, bool hasPreviousPage
});




}
/// @nodoc
class _$PaginationInfoEntityCopyWithImpl<$Res>
    implements $PaginationInfoEntityCopyWith<$Res> {
  _$PaginationInfoEntityCopyWithImpl(this._self, this._then);

  final PaginationInfoEntity _self;
  final $Res Function(PaginationInfoEntity) _then;

/// Create a copy of PaginationInfoEntity
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


/// Adds pattern-matching-related methods to [PaginationInfoEntity].
extension PaginationInfoEntityPatterns on PaginationInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _PaginationInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationInfoEntity() when $default != null:
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
case _PaginationInfoEntity() when $default != null:
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
case _PaginationInfoEntity():
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
case _PaginationInfoEntity() when $default != null:
return $default(_that.limit,_that.offset,_that.total,_that.page,_that.totalPages,_that.hasNextPage,_that.hasPreviousPage);case _:
  return null;

}
}

}

/// @nodoc


class _PaginationInfoEntity implements PaginationInfoEntity {
  const _PaginationInfoEntity({this.limit = 0, this.offset = 0, this.total = 0, this.page = 0, this.totalPages = 0, this.hasNextPage = false, this.hasPreviousPage = false});
  

@override@JsonKey() final  int limit;
@override@JsonKey() final  int offset;
@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  bool hasPreviousPage;

/// Create a copy of PaginationInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationInfoEntityCopyWith<_PaginationInfoEntity> get copyWith => __$PaginationInfoEntityCopyWithImpl<_PaginationInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationInfoEntity&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage));
}


@override
int get hashCode => Object.hash(runtimeType,limit,offset,total,page,totalPages,hasNextPage,hasPreviousPage);

@override
String toString() {
  return 'PaginationInfoEntity(limit: $limit, offset: $offset, total: $total, page: $page, totalPages: $totalPages, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage)';
}


}

/// @nodoc
abstract mixin class _$PaginationInfoEntityCopyWith<$Res> implements $PaginationInfoEntityCopyWith<$Res> {
  factory _$PaginationInfoEntityCopyWith(_PaginationInfoEntity value, $Res Function(_PaginationInfoEntity) _then) = __$PaginationInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 int limit, int offset, int total, int page, int totalPages, bool hasNextPage, bool hasPreviousPage
});




}
/// @nodoc
class __$PaginationInfoEntityCopyWithImpl<$Res>
    implements _$PaginationInfoEntityCopyWith<$Res> {
  __$PaginationInfoEntityCopyWithImpl(this._self, this._then);

  final _PaginationInfoEntity _self;
  final $Res Function(_PaginationInfoEntity) _then;

/// Create a copy of PaginationInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? offset = null,Object? total = null,Object? page = null,Object? totalPages = null,Object? hasNextPage = null,Object? hasPreviousPage = null,}) {
  return _then(_PaginationInfoEntity(
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
