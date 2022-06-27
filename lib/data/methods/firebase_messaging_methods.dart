import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingMethods {
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> get fcmToken async => await _messaging.getToken();

  void listenForeground() {
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      if (message != null) {
        log(message.notification!.title!);
      }
    });
  }
}
