import 'package:talker_flutter/talker_flutter.dart';

/// Instancia global de Talker para logging en toda la aplicación
final talker = TalkerFlutter.init(
  settings: TalkerSettings(useHistory: true, useConsoleLogs: true),
  logger: TalkerLogger(
    settings: TalkerLoggerSettings(
      colors: {
        LogLevel.critical: AnsiPen()..red(bold: true),
        LogLevel.error: AnsiPen()..red(),
        LogLevel.warning: AnsiPen()..yellow(),
        LogLevel.info: AnsiPen()..cyan(),
        LogLevel.debug: AnsiPen()..gray(),
        LogLevel.verbose: AnsiPen()..gray(),
      },
    ),
  ),
);
