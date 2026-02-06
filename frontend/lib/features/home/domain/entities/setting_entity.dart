import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/core/core.dart';

part 'setting_entity.freezed.dart';
part 'setting_entity.g.dart';

@freezed
sealed class SettingEntity with _$SettingEntity {
  const factory SettingEntity({
    @JsonKey(name: 'dark_mode_active', defaultValue: false) required bool darkModeActive,
  }) = _SettingEntity;

  factory SettingEntity.fromJson(Map<String, dynamic> json) => _$SettingEntityFromJson(json);
}
