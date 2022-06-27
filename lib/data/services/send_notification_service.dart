import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SendNotificationServices {
  static void requestOutpassNotification(String token, String title) async {
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    var body = {
      'to': token,
      'notification': {
        'body': 'Your notify ',
        'title': title,
        "android_channel_id": "demo_channel"
      },
    };

    var headers = {
      "Authorization":
          " key = AAAA8YbRoAo:APA91bGWTOlZT1z_K3K4Y8jhVzYC77y4iiS0C--yj1kNpt5kXlgIyyRJhAsv3Zxm655R4Y_qPmKSczWJLZtSWF6I5hlM28FT4SEwq6yvePtiKeXoH2gwnCEQa1SOAdvBcIeweYWZh2u_",
      "Content-Type": "application/json"
    };

    var response =
        await http.post(url, body: json.encode(body), headers: headers);

    log(response.body);

    if (response.statusCode == 200) {
      log('Notification sent !!!!');
    }
  }
}
