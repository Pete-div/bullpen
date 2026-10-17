// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:fishma/_lib.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// class FirebaseGeneralMessenger {
//   final FirebaseMessaging _generalFirebaseMessaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<String> getDeviceToken() async {
//     String? deviceTkn = await _generalFirebaseMessaging.getToken();
//     return deviceTkn ?? '';
//   }

//   void onRefreshTkn() {
//     _generalFirebaseMessaging.onTokenRefresh.listen((event) {
//     });
//   }

//   void requestPermission() async {
//     NotificationSettings notificationSettings =
//         await _generalFirebaseMessaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       sound: true,
//       provisional: true,
//     );

//     switch (notificationSettings.authorizationStatus) {
//       case AuthorizationStatus.authorized:
//         break;
//       case AuthorizationStatus.provisional:
//         break;
//       default:
//     }
//   }

//   Future<void> firebaseInit(WidgetRef ref) async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//         FirebaseGeneralMessenger().initializeLocalNotification( ref);

//       if (message.notification != null) {
//         await showMessage(message);
//       }
//     });
//   }

//   void initializeLocalNotification(WidgetRef ref) async {
//     var initSettings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/fishma'),
//       iOS: DarwinInitializationSettings(),
//     );

//     await _flutterLocalNotificationsPlugin.initialize(
//       initSettings,
// onDidReceiveNotificationResponse: (notificationResponse) {
//   if (notificationResponse.payload != null) {

//     try {
//       final Map<String, dynamic> messageData = jsonDecode(notificationResponse.payload!);

//       final notificationType = messageData['notification_type'];

//       if (notificationType == null) {
//         return;
//       }

//       final RemoteMessage formattedMessage = RemoteMessage.fromMap({
//         "messageId": messageData["data_id"] ?? "default_id",
//         "data": messageData,
//         "notification": {
//           "title": messageData["title"] ?? "New Notification",
//           "body": messageData["body"] ?? "You have a new message"
//         }
//       });

//       FirebaseApiService().handleMessage(formattedMessage, ref);
//     } catch (e) {
//     }
//   }
// }

//   );
// }

//   Future<void> showMessage(RemoteMessage message) async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       importance: Importance.max,
//     description: 'Channel for important notifications',
//     playSound: true,
//     );

//     final androidDetails = AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: 'Channel for important notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       ticker: 'ticker',
//     );

//     const iOSDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentSound: true,
//       presentBadge: true,
//     );

//     final notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iOSDetails);
//   int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;

//     await _flutterLocalNotificationsPlugin.show(
//       notificationId,
//       message.notification?.title,
//       message.notification?.body,
//       notificationDetails,
//       payload:   jsonEncode({
//       "notification_type": message.data['notification_type'],
//       "data_id": message.data['data_id'],
//       "extra_field": message.data['extra_field'],
//     }),
//       //jsonEncode(message.data),
//     );

//   }
//  }

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// }

// class FirebaseApiService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();
// void handleMessage(RemoteMessage message, WidgetRef ref) {
//   final context = navigatorKey.currentContext;
//   if (context == null) {
//     return;
//   }
//   final String? notificationType = message.data['notification_type'];
//   final String? notificationId = message.data['data_id'];
//   final String? userId = message.data['extra_field'];

//   if (notificationType == null) {
//     return;
//   }

//   switch (notificationType) {
//     case 'chat':
//       Future.microtask(() {

//       });
//       break;

//     case 'forum':
//       Future.microtask(() {
//       });
//       break;

//     case 'post':
//       Future.microtask(() {
//       });
//     case 'comment':
//     case 'repost':
//     case 'like':
//     case 'save':
//       Future.microtask(() {
//       });
//       break;
//    case 'connection':
//       Future.microtask(() {
//       });
//       break;

//          case 'recommendation':
//       Future.microtask(() {
//    });
//       break;
//               case 'user':
//       Future.microtask(() {
//     });
//       break;
//     case 'group':
//       Future.microtask(() {

//       });
//       break;

//     default:
//   }
// }

//   Future<void> initLocalNotifications(WidgetRef ref) async {
//     const settings = InitializationSettings(
//       android: AndroidInitializationSettings("@drawable/fishma"),
//       iOS: DarwinInitializationSettings(),
//     );

//     await _localNotifications.initialize(settings, onDidReceiveNotificationResponse: (payload) {
//       final message = RemoteMessage.fromMap(jsonDecode(payload.payload!));
//       handleMessage(message, ref);
//     });
//   }

//   Future<void> initPushNotifications(WidgetRef ref) async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) handleMessage(message, ref);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       handleMessage(message, ref);
//     });

//     FirebaseMessaging.onMessage.listen((message) async {
//         FirebaseGeneralMessenger().initializeLocalNotification(ref);
//       if (message.notification != null) {
//         await FirebaseGeneralMessenger().showMessage(message);
//       }
//     });

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   Future<void> initNotifications(WidgetRef ref) async {
//     await _firebaseMessaging.requestPermission();
//     await initPushNotifications(ref);
//     await initLocalNotifications(ref);
//   }
// }
