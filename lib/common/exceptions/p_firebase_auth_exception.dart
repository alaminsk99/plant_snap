class PFirebaseAuthException implements Exception {
  final String code;

  PFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is malformed.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        return 'Signing in with Email and Password is not enabled.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}