import 'dart:convert';
import 'dart:io';

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:class_link/global/utils/get_snackbar.dart';
import 'package:class_link/services/notification/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../global/const/app_credentials.dart';

class FcmHelper {
  // prevent making instance
  FcmHelper._();

  // FCM Messaging
  static late FirebaseMessaging messaging;

  /// It takes a title and body, and sends a notification to the user's device
  ///
  /// Args:
  ///   title (String): The title of the notification.
  ///   body (String): The body of the notification.
  ///   route (String): The route to navigate to when the notification is tapped.
  static Future<void> createFCMNotification(
      {required String title,
      required String body,
      String? redialURL = "",
      String? route}) async {
    const url = "https://fcm.googleapis.com/fcm/send";
    final token = await _generateFcmToken();
    if (token != null) {
      final map = {
        "to": token,
        "notification": {"title": title, "body": body},
        "data": {"route": route ?? "", "redialURL": url}
      };
      final header = {
        'Content-Type': 'application/json',
        'Authorization': notificationServerKey
      };
      try {
        final res = await http.post(
          Uri.parse(url),
          body: jsonEncode(map),
          headers: (header),
        );
        if (res.statusCode != 200) {
          throw HttpException(
              'Unexpected status code ${res.statusCode}:'
              ' ${res.reasonPhrase}',
              uri: Uri.parse(url));
        }
      } on HttpException catch (_) {
        rethrow;
      } catch (_) {
        rethrow;
      }
    }
  }

  /// this function will initialize firebase and fcm instance
  static Future<void> get initFcm async {
    try {
      // initialize fcm and firebase core
      await Firebase.initializeApp(
          // TODO: uncomment this line if you connected to firebase via cli
          //options: DefaultFirebaseOptions.currentPlatform,
          );
      // initialize firebase
      messaging = FirebaseMessaging.instance;

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      await _generateFcmToken();

      // background and foreground handlers
      // FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      // FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      Message("Error initializing FCM", "$error");
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  static Future<String?> _generateFcmToken() async {
    try {
      final token = await messaging.getToken();
      return token;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// this method will be triggered when the app generate fcm
  /// token successfully
  // static _sendFcmTokenToServer(){
  //   var token = MySharedPref.getFcmToken();
  //   // TODO SEND FCM TOKEN TO SERVER
  // }

  ///handle fcm notification when app is closed/terminated
  /// if you are wondering about this annotation read the following
  /// https://stackoverflow.com/a/67083337
  // @pragma('vm:entry-point')
  // static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  //   NotificationService.awesomeNotifications.createNotification(
  //     content: NotificationContent(
  //       id: 20,
  //       channelKey: "",
  //       color: Get.theme.primaryColor,
  //       title: message.notification?.title ?? '',
  //       body: message.notification?.body ?? '',
  //       bigPicture:
  //           "https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg",
  //       notificationLayout: NotificationLayout.BigPicture,
  //       payload: {
  //         "route": message.data['route'] ?? "",
  //       },
  //     ),
  //   );
  // }
}
