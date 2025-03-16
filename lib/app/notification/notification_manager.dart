import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationClick(response.payload);
      },
    );

    // Create the notification channel for Android 8.0 (API level 26) and above
    const String channelId = 'notification_channel';
    const String channelName = 'Notification Channel';
    const String channelDescription = 'Channel for important notifications';

    final AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      channelId, // ID of the channel
      channelName, // Name of the channel
      description: channelDescription, // Description of the channel
      importance: Importance.high, // Set the importance level
    );

    // Register the notification channel with the plugin
    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }

  void _handleNotificationClick(String? payload) {
    if (payload != null) {
      print('Notification payload: $payload');
      // Navigate or perform some action
    }
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
  }) async {
    final DateTime currentTime = DateTime.now();

    if (scheduledTime.isBefore(currentTime)) {
      print("Scheduled time must be in the future");
      return; // Prevent scheduling in the past
    }

    final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(
      scheduledTime,
      tz.local,
    );

    // Define notification details
    const String channelId = 'notification_channel';
    final AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelId,
      'Notification Channel',
      channelDescription: 'Channel for important notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Schedule the notification
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDateTime,
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exact,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }
}
