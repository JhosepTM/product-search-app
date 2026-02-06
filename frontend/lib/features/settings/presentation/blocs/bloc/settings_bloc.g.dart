// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsState _$SettingsStateFromJson(Map<String, dynamic> json) =>
    _SettingsState(
      status:
          $enumDecodeNullable(_$SettingsStatusEnumMap, json['status']) ??
          SettingsStatus.NONE,
      visualSetting: json['visualSetting'] == null
          ? const SettingEntity(darkModeActive: false)
          : SettingEntity.fromJson(
              json['visualSetting'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SettingsStateToJson(_SettingsState instance) =>
    <String, dynamic>{
      'status': _$SettingsStatusEnumMap[instance.status]!,
      'visualSetting': instance.visualSetting.toJson(),
    };

const _$SettingsStatusEnumMap = {
  SettingsStatus.NONE: 'NONE',
  SettingsStatus.UPDATING_VISUAL_SETTING: 'UPDATING_VISUAL_SETTING',
  SettingsStatus.UPDATED_VISUAL_SETTING: 'UPDATED_VISUAL_SETTING',
  SettingsStatus.ERROR_UPDATING_VISUAL_SETTING: 'ERROR_UPDATING_VISUAL_SETTING',
};
