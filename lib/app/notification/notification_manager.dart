import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:one_does_project/presentation/favorite_book/view/favorite_book_screen.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  final GlobalKey<NavigatorState> navigatorKey;
  NotificationRepository({required this.navigatorKey});

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// **Bildirimleri Başlatan Fonksiyon**
  Future<void> initNotification() async {
    // Android Başlatma Ayarları
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS Başlatma Ayarları
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    // Genel Başlatma Ayarları
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    // Bildirimleri Başlat
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        _notificationOnTap(response);
      },
    );

    // **Android için Bildirim Kanalı Tanımlama**
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'channelId', // Kanal ID
      'channelName', // Kanal İsmi
      description: 'Notification Process',
      importance: Importance.max,
    );

    // Android için bildirimi kanalına bağlama
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Zaman dilimlerini başlat
    tz.initializeTimeZones();
  }

  /// **Bildirim tıklandığında açılacak ekran**
  void _notificationOnTap(NotificationResponse response) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => FavoriteBooksScreen(),
      ),
    );
  }

  /// **Bildirimin Detaylarını Tanımlama**
  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  /// **Anlık Bildirim Gönderme**
  Future<void> notificationShow({
    int id = 0,
    String? title,
    String? body,
  }) async {
    await notificationsPlugin.show(id, title, body, _notificationDetails());
  }

  /// **Zamanlanmış Bildirim Gönderme**
  Future<void> scheduleNotification({
    required int id,
    String? title,
    String? body,
    required DateTime scheduledTime,
  }) async {
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
       // **Zamanı doğru ayarla**
      _notificationDetails(), // **Doğru bildirim detaylarını ekle**
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // **Günün belirli saatinde çalıştır**
    );
  }
}
