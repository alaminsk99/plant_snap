class PPlatformException implements Exception {
  final String code;

  PPlatformException(this.code);

  String get message {
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        return 'The email address is malformed.';
      case 'ERROR_WRONG_PASSWORD':
        return 'The password is incorrect.';
      case 'ERROR_USER_NOT_FOUND':
        return 'No user found with this email.';
      case 'ERROR_USER_DISABLED':
        return 'This user has been disabled.';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Too many requests. Try again later.';
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'Signing in with Email and Password is not enabled.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}