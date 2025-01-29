// lib/services/api_config.dart
class ApiConfig {
  static const String baseUrl = 'https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent';
  static const int maxRetries = 3;
  static const Duration timeoutDuration = Duration(seconds: 30);
}