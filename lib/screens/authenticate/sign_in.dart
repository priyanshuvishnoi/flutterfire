import 'package:flutter/material.dart';
import 'package:flutterfire/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function view;
  SignIn({this.view});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

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
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.view();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
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
                //email field
                TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email.' : null,
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                //password field
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter a password.' : null,
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
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Could not sign in with those credentials!!!');
                      }
                    }
                  },
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 12),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),
              ],
            )),
      ),
    );
  }
}
