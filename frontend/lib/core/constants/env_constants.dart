import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConstants {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080';
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
