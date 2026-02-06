part of 'settings_bloc.dart';

enum SettingsStatus {
  NONE,
  UPDATING_VISUAL_SETTING,
  UPDATED_VISUAL_SETTING,
  ERROR_UPDATING_VISUAL_SETTING,
}

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SettingsStatus.NONE) SettingsStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false) Failure? failure,
    @Default(SettingEntity(darkModeActive: false)) SettingEntity visualSetting,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);
}
