import 'package:flutter/material.dart';
import 'package:flutterfire/screens/authenticate/authenticate.dart';
import 'package:flutterfire/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutterfire/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if (user == null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}
