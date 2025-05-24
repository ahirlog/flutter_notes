import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_notes/notification_services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    notificationServices.requestNotificationPermission();
    notificationServices.foregroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);

    // No need to call all time
    // notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      print('Device token: $value');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            notificationServices.getDeviceToken().then((value) async {
              var data = {
                'to': value.toString(),
                'priority': 'high',
                'notification': {
                  'title': 'Asif',
                  'body': 'Subscribe to my channel',
                }
              };

              await http.post(
                Uri.parse('https://fcm.googleapis.com/fcm/send'),
                body: jsonEncode(data),
                headers: {
                  'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': 'key=AAAAP9pXDFM:APA91bGhBeMCUABE2PXj1...'
                },
              );
            });
          },
          child: const Text('Send Notifications'),
        ),
      ),
    );
  }
}
