import 'package:flutter/material.dart';
import 'package:notifications/data/methods/firebase_messaging_methods.dart';
import 'package:notifications/data/services/send_notification_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    FirebaseMessagingMethods().listenForeground();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'Title'),
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              var token = await FirebaseMessagingMethods().fcmToken;
              await Future.delayed(Duration(seconds: 3));
              SendNotificationServices.requestOutpassNotification(
                  token!, titleController.text);
            },
            child: Text('Send'),
          )
        ],
      ),
    );
  }
}
