import 'package:flutter/material.dart';
import 'package:flutterfire/services/auth.dart';

class Register extends StatefulWidget {
  final Function view;
  Register({this.view});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.view();
              },
              icon: Icon(Icons.person),
              label: Text('Sign in'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                // email feild
                TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email.' : null,
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (val) {
                      setState(
                        () {
                          email = val;
                        },
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                // password field
                TextFormField(
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long.' : null,
                  decoration: InputDecoration(labelText: 'Password'),
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    }
                  },
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 12),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 18)),
              ],
            )),
      ),
    );
  }
}
