import 'package:frontend/core/core.dart';
import 'package:frontend/features/home/domain/entities/setting_entity.dart';

part 'settings_bloc.g.dart';
part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<_UpsertVisualSetting>(_onUpsertVisualSetting);
  }

  Future<void> _onUpsertVisualSetting(
    _UpsertVisualSetting event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: SettingsStatus.UPDATING_VISUAL_SETTING));
    try {
      emit(state.copyWith(
        visualSetting: event.visualSetting,
        status: SettingsStatus.UPDATED_VISUAL_SETTING,
      ));
    } catch (e) {
      emit(state.copyWith(status: SettingsStatus.ERROR_UPDATING_VISUAL_SETTING));
    }
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}

