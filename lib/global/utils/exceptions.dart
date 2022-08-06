class UserSignInFlowCancelled implements Exception {
  @override
  String toString() {
    return 'Sign in flow cancelled by user!';
  }
}
