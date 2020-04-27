import 'package:flutter/material.dart';
import 'package:flutterfire/screens/authenticate/register.dart';
import 'package:flutterfire/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showsignin = true;

  void toggleView(){
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return SignIn(view: toggleView);
    } else {
      return Register(view: toggleView);
    }
  }
}
