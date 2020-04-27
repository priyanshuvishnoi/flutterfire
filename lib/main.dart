import 'package:flutter/material.dart';
import 'package:flutterfire/screens/wrapper.dart';
import 'package:flutterfire/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutterfire/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

