import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationService {
  static ReceivedAction? initialAction;
  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  static Future<void> initializeLocalNotifications() async {
    await awesomeNotifications.initialize(
      null,
      <NotificationChannel>[
        NotificationChannel(
            channelKey: 'alert',
            channelName: 'alert',
            channelDescription: 'Notification teset as alert',
            playSound: true,
            onlyAlertOnce: true,
            importance: NotificationImportance.High),
        NotificationChannel(
            channelGroupKey: 'basic_group',
            channelKey: 'basic_channel',
            channelName: 'Basic Notification',
            channelDescription: 'Shedule Notification',
            playSound: true,
            importance: NotificationImportance.Default),
      ],
      debug: true,
    );

    /// This is used to get the initial action when the app is opened from a notification.
    initialAction = await awesomeNotifications.getInitialNotificationAction(
      removeFromActionEvents: false,
    );
  }

  /// > When the app is in the background and a notification is received, the app will navigate to the
  /// route specified in the notification payload
  ///
  /// Args:
  ///   receivedAction (ReceivedAction): The received action object.
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.payload != null) {
      if (receivedAction.payload!['route'] != null) {
        Get.toNamed(receivedAction.payload!['route']!);
      }
    }
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }
}
