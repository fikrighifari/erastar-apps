import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseService {
  late FirebaseMessaging messaging;

  late AndroidNotificationChannel channel;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future init() async {
    print('------init_firebase------');
    this.messaging = FirebaseMessaging.instance;

    //Firebase _firebaseMessaging
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Init Local notification channel
    this._initLocalNotificationChannel();

    //Set Local Notification
    this.initializeFlutterLocalNotification();

    // Initialize flutter local notification
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //Request Permision
    await this._requestPermissionNotification();

    /**
     * Check Token firebase FCM 
     */
    await this._getTokenDevice();

    /**
     * Listen for foreground FCM and fire Flutter Local Notification
     */
    this._listenForegroundMessages();

    /**
     * Setup for interaction notification FCM ex: when Notification on click User
     */
    this._setupInteractedMessage();
  }

  Future _requestPermissionNotification() async {
    NotificationSettings settings = await this.messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

    log('User granted permission: ${settings.authorizationStatus}');
  }

  void _listenForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log(message.data.toString());
      if (message.notification != null) {
        RemoteNotification notification = message.notification!;

        /**
         * Fire Flutter Local Notification
         */
        this.flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  this.channel.id,
                  this.channel.name,
                  channelDescription: this.channel.description,
                  playSound: true,
                  enableVibration: true,
                  icon: '@drawable/ic_stat_name',
                ),
              ),
              payload: jsonEncode(message.data),
            );
      }
    });
  }

  void _initLocalNotificationChannel() {
    //Global Initialization
    this.channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
    );
  }

  void initializeFlutterLocalNotification() {
    // flutter local notification
    this.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /**
     * Android notification initialization
     */
    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_name');

    /**
     * IOS notification initialization
     */
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    /**
     * Combine platform initialize
     */
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    this.flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (payload != null) {
          /**
           * Handle on tap Flutter Local Notification
           */
          // this._handleNotificationOnTap(payload);
        }
      },
    );
  }

  // void _handleNotificationOnTap(dynamic message) {
  //   FcmPayloadResponse? fcmPayloadResponse;
  //   if (message is RemoteMessage) {
  //     fcmPayloadResponse = FcmPayloadResponse.fromMap(message.data);
  //   }
  //   if (message is String) {
  //     fcmPayloadResponse = FcmPayloadResponse.fromJson(message);
  //   }

  //   GetStorage().write(CStorage.PAYLOAD, fcmPayloadResponse?.toMap() ?? {});

  //   if (Get.context != null) {
  //     OnAppOpenService.init();
  //   }
  // }

  Future _getTokenDevice() async {
    // use the returned token to send messages to users from your custom server
    String? token = await messaging.getToken();

    log(token ?? 'TOKEN KOSONG');
  }

  Future<void> _setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      // _handleNotificationOnTap(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationOnTap);
  }
}
