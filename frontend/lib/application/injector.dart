import 'package:frontend/core/core.dart';
import 'package:frontend/features/settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final GetIt _locator = GetIt.instance;
  // When set to true tests can force the injector to use an in-memory DB
  static bool useInMemoryDatabase = false;

  // Convenience accessor: `Injector.get<T>()` -> resolves from GetIt instance.
  static T get<T extends Object>() => _locator<T>();

  static Future<void> init() async {
  _registerBlocs();
  }

  static void _registerBlocs() {
    void regBloc<T extends BlocBase<dynamic>>(T Function() factory) {
      _locator.registerLazySingleton<T>(
        factory,
        // ignore: always_specify_types
        dispose: (b) async {
          try {
            await b.close();
          } catch (_) {}
        },
      );
    }
    
    regBloc<SettingsBloc>(() => SettingsBloc());
  }
}
