import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/application/injector.dart';
import 'package:frontend/application/routes/app_router.dart';
import 'package:frontend/application/theme/app_theme.dart';
import 'package:frontend/core/core.dart';
import 'package:frontend/core/utils/talker_util.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:frontend/features/settings/presentation/blocs/bloc/settings_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );
  HydratedBloc.storage = storage;

  await Injector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>.value(value: Injector.get<SettingsBloc>()),
        BlocProvider<ProductBloc>.value(value: Injector.get<ProductBloc>()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final isDarkMode = state.visualSetting.darkModeActive;

          return MaterialApp.router(
            title: 'Search Product App',
            routerConfig: appRouter,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            builder: (context, child) {
              // Envolver con TalkerWrapper solo en modo debug
              if (kDebugMode) {
                return TalkerWrapper(
                  talker: talker,
                  child: child ?? const SizedBox.shrink(),
                );
              }
              return child ?? const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
