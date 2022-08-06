import 'package:in_app_review/in_app_review.dart';

class InAppRating {
  final InAppReview inAppReview = InAppReview.instance;

  Future<void> get requestReview async {
    await Future.delayed(const Duration(seconds: 5));
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      print("In-app review not available");
    }
  }
}
