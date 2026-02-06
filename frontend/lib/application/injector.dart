import 'package:frontend/core/core.dart';
import 'package:frontend/features/catalog/data/datasources/product_remote_datasource.dart';
import 'package:frontend/features/catalog/data/repositories/product_respository_impl.dart';
import 'package:frontend/features/catalog/domain/repositories/product_repository.dart';
import 'package:frontend/features/catalog/domain/usecases/product_use_cases.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
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
    _registerDataSources();
    _registerRepositories();
    _registerUseCases();
    _registerBlocs();
  }

  static void _registerDataSources() {
    _locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(),
    );
  }

  static void _registerRepositories() {
    _locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        productRemoteDataSource: _locator<ProductRemoteDataSource>(),
      ),
    );
  }

  static void _registerUseCases() {
    _locator.registerLazySingleton<ProductUseCases>(
      () => ProductUseCases(
        repository: _locator<ProductRepository>(),
      ),
    );
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
    regBloc<ProductBloc>(() => ProductBloc(productUseCases: Injector.get<ProductUseCases>()));
  }
}
