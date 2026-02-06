// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {

 SettingEntity get visualSetting;
/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsEventCopyWith<SettingsEvent> get copyWith => _$SettingsEventCopyWithImpl<SettingsEvent>(this as SettingsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent&&(identical(other.visualSetting, visualSetting) || other.visualSetting == visualSetting));
}


@override
int get hashCode => Object.hash(runtimeType,visualSetting);

@override
String toString() {
  return 'SettingsEvent(visualSetting: $visualSetting)';
}


}

/// @nodoc
abstract mixin class $SettingsEventCopyWith<$Res>  {
  factory $SettingsEventCopyWith(SettingsEvent value, $Res Function(SettingsEvent) _then) = _$SettingsEventCopyWithImpl;
@useResult
$Res call({
 SettingEntity visualSetting
});


$SettingEntityCopyWith<$Res> get visualSetting;

}
/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._self, this._then);

  final SettingsEvent _self;
  final $Res Function(SettingsEvent) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visualSetting = null,}) {
  return _then(_self.copyWith(
visualSetting: null == visualSetting ? _self.visualSetting : visualSetting // ignore: cast_nullable_to_non_nullable
as SettingEntity,
  ));
}
/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<$Res> get visualSetting {
  
  return $SettingEntityCopyWith<$Res>(_self.visualSetting, (value) {
    return _then(_self.copyWith(visualSetting: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpsertVisualSetting value)?  upsertVisualSetting,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpsertVisualSetting() when upsertVisualSetting != null:
return upsertVisualSetting(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpsertVisualSetting value)  upsertVisualSetting,}){
final _that = this;
switch (_that) {
case _UpsertVisualSetting():
return upsertVisualSetting(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpsertVisualSetting value)?  upsertVisualSetting,}){
final _that = this;
switch (_that) {
case _UpsertVisualSetting() when upsertVisualSetting != null:
return upsertVisualSetting(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SettingEntity visualSetting)?  upsertVisualSetting,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpsertVisualSetting() when upsertVisualSetting != null:
return upsertVisualSetting(_that.visualSetting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SettingEntity visualSetting)  upsertVisualSetting,}) {final _that = this;
switch (_that) {
case _UpsertVisualSetting():
return upsertVisualSetting(_that.visualSetting);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SettingEntity visualSetting)?  upsertVisualSetting,}) {final _that = this;
switch (_that) {
case _UpsertVisualSetting() when upsertVisualSetting != null:
return upsertVisualSetting(_that.visualSetting);case _:
  return null;

}
}

}

/// @nodoc


class _UpsertVisualSetting implements SettingsEvent {
  const _UpsertVisualSetting({required this.visualSetting});
  

@override final  SettingEntity visualSetting;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpsertVisualSettingCopyWith<_UpsertVisualSetting> get copyWith => __$UpsertVisualSettingCopyWithImpl<_UpsertVisualSetting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpsertVisualSetting&&(identical(other.visualSetting, visualSetting) || other.visualSetting == visualSetting));
}


@override
int get hashCode => Object.hash(runtimeType,visualSetting);

@override
String toString() {
  return 'SettingsEvent.upsertVisualSetting(visualSetting: $visualSetting)';
}


}

/// @nodoc
abstract mixin class _$UpsertVisualSettingCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory _$UpsertVisualSettingCopyWith(_UpsertVisualSetting value, $Res Function(_UpsertVisualSetting) _then) = __$UpsertVisualSettingCopyWithImpl;
@override @useResult
$Res call({
 SettingEntity visualSetting
});


@override $SettingEntityCopyWith<$Res> get visualSetting;

}
/// @nodoc
class __$UpsertVisualSettingCopyWithImpl<$Res>
    implements _$UpsertVisualSettingCopyWith<$Res> {
  __$UpsertVisualSettingCopyWithImpl(this._self, this._then);

  final _UpsertVisualSetting _self;
  final $Res Function(_UpsertVisualSetting) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visualSetting = null,}) {
  return _then(_UpsertVisualSetting(
visualSetting: null == visualSetting ? _self.visualSetting : visualSetting // ignore: cast_nullable_to_non_nullable
as SettingEntity,
  ));
}

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<$Res> get visualSetting {
  
  return $SettingEntityCopyWith<$Res>(_self.visualSetting, (value) {
    return _then(_self.copyWith(visualSetting: value));
  });
}
}


/// @nodoc
mixin _$SettingsState {

 SettingsStatus get status;@JsonKey(includeFromJson: false, includeToJson: false) Failure? get failure; SettingEntity get visualSetting;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);

  /// Serializes this SettingsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.visualSetting, visualSetting) || other.visualSetting == visualSetting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,failure,visualSetting);

@override
String toString() {
  return 'SettingsState(status: $status, failure: $failure, visualSetting: $visualSetting)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 SettingsStatus status,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure, SettingEntity visualSetting
});


$SettingEntityCopyWith<$Res> get visualSetting;

}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? failure = freezed,Object? visualSetting = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettingsStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,visualSetting: null == visualSetting ? _self.visualSetting : visualSetting // ignore: cast_nullable_to_non_nullable
as SettingEntity,
  ));
}
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<$Res> get visualSetting {
  
  return $SettingEntityCopyWith<$Res>(_self.visualSetting, (value) {
    return _then(_self.copyWith(visualSetting: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SettingsStatus status, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure,  SettingEntity visualSetting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.status,_that.failure,_that.visualSetting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SettingsStatus status, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure,  SettingEntity visualSetting)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.status,_that.failure,_that.visualSetting);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SettingsStatus status, @JsonKey(includeFromJson: false, includeToJson: false)  Failure? failure,  SettingEntity visualSetting)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.status,_that.failure,_that.visualSetting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettingsState implements SettingsState {
  const _SettingsState({this.status = SettingsStatus.NONE, @JsonKey(includeFromJson: false, includeToJson: false) this.failure, this.visualSetting = const SettingEntity(darkModeActive: false)});
  factory _SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);

@override@JsonKey() final  SettingsStatus status;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Failure? failure;
@override@JsonKey() final  SettingEntity visualSetting;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.status, status) || other.status == status)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.visualSetting, visualSetting) || other.visualSetting == visualSetting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,failure,visualSetting);

@override
String toString() {
  return 'SettingsState(status: $status, failure: $failure, visualSetting: $visualSetting)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 SettingsStatus status,@JsonKey(includeFromJson: false, includeToJson: false) Failure? failure, SettingEntity visualSetting
});


@override $SettingEntityCopyWith<$Res> get visualSetting;

}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? failure = freezed,Object? visualSetting = null,}) {
  return _then(_SettingsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettingsStatus,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,visualSetting: null == visualSetting ? _self.visualSetting : visualSetting // ignore: cast_nullable_to_non_nullable
as SettingEntity,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettingEntityCopyWith<$Res> get visualSetting {
  
  return $SettingEntityCopyWith<$Res>(_self.visualSetting, (value) {
    return _then(_self.copyWith(visualSetting: value));
  });
}
}

// dart format on
