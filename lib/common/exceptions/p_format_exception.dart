class PFormatException implements Exception {
  final String message;

  const PFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);
}