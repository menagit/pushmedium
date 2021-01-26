import 'package:flutter/material.dart';
import 'package:pushmedium/src/service/push_fcm_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _notificationMsg = 'No Message';

  @override
  void initState() {
    super.initState();
    FCM firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();
    firebaseMessaging.streamCtlr.stream.listen((msgData) {
      _changeMsg(msgData);
    });
  }

  _changeMsg(String msg) {
    setState(() {
      _notificationMsg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PushMedium',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Notifications'),
        ),
        body: Center(
          child: Container(
            child: Text(_notificationMsg),
          ),
        ),
      ),
    );
  }
}
