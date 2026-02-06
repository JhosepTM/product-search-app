// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingEntity {

@JsonKey(name: 'dark_mode_active', defaultValue: false) bool get darkModeActive;
/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<SettingEntity> get copyWith => _$SettingEntityCopyWithImpl<SettingEntity>(this as SettingEntity, _$identity);

  /// Serializes this SettingEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingEntity&&(identical(other.darkModeActive, darkModeActive) || other.darkModeActive == darkModeActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darkModeActive);

@override
String toString() {
  return 'SettingEntity(darkModeActive: $darkModeActive)';
}


}

/// @nodoc
abstract mixin class $SettingEntityCopyWith<$Res>  {
  factory $SettingEntityCopyWith(SettingEntity value, $Res Function(SettingEntity) _then) = _$SettingEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dark_mode_active', defaultValue: false) bool darkModeActive
});




}
/// @nodoc
class _$SettingEntityCopyWithImpl<$Res>
    implements $SettingEntityCopyWith<$Res> {
  _$SettingEntityCopyWithImpl(this._self, this._then);

  final SettingEntity _self;
  final $Res Function(SettingEntity) _then;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? darkModeActive = null,}) {
  return _then(_self.copyWith(
darkModeActive: null == darkModeActive ? _self.darkModeActive : darkModeActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingEntity].
extension SettingEntityPatterns on SettingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingEntity value)  $default,){
final _that = this;
switch (_that) {
case _SettingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dark_mode_active', defaultValue: false)  bool darkModeActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
return $default(_that.darkModeActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dark_mode_active', defaultValue: false)  bool darkModeActive)  $default,) {final _that = this;
switch (_that) {
case _SettingEntity():
return $default(_that.darkModeActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dark_mode_active', defaultValue: false)  bool darkModeActive)?  $default,) {final _that = this;
switch (_that) {
case _SettingEntity() when $default != null:
return $default(_that.darkModeActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingEntity implements SettingEntity {
  const _SettingEntity({@JsonKey(name: 'dark_mode_active', defaultValue: false) required this.darkModeActive});
  factory _SettingEntity.fromJson(Map<String, dynamic> json) => _$SettingEntityFromJson(json);

@override@JsonKey(name: 'dark_mode_active', defaultValue: false) final  bool darkModeActive;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingEntityCopyWith<_SettingEntity> get copyWith => __$SettingEntityCopyWithImpl<_SettingEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingEntity&&(identical(other.darkModeActive, darkModeActive) || other.darkModeActive == darkModeActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,darkModeActive);

@override
String toString() {
  return 'SettingEntity(darkModeActive: $darkModeActive)';
}


}

/// @nodoc
abstract mixin class _$SettingEntityCopyWith<$Res> implements $SettingEntityCopyWith<$Res> {
  factory _$SettingEntityCopyWith(_SettingEntity value, $Res Function(_SettingEntity) _then) = __$SettingEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dark_mode_active', defaultValue: false) bool darkModeActive
});




}
/// @nodoc
class __$SettingEntityCopyWithImpl<$Res>
    implements _$SettingEntityCopyWith<$Res> {
  __$SettingEntityCopyWithImpl(this._self, this._then);

  final _SettingEntity _self;
  final $Res Function(_SettingEntity) _then;

/// Create a copy of SettingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? darkModeActive = null,}) {
  return _then(_SettingEntity(
darkModeActive: null == darkModeActive ? _self.darkModeActive : darkModeActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
