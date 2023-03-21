import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:in_app_review/in_app_review.dart';

/// The class checks if the user has rated the app. If the user has not rated the app, then the app will
/// ask the user to rate the app. If the user has rated the app, then the app will not ask the user to
/// rate the app
class InAppRating {
  static Future<void> get checkIfUserHasRatedApp async =>
      (!await InAppReview.instance.isAvailable())
          ? InAppReview.instance.requestReview()
          : Message("Success test", "You have already rated the app");
}
