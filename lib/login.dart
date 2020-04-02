import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvinno/signup.dart';

import 'data.dart';
import 'main_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Data note;
    Color color = new Color(0xFF158203);
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Material(
          child: Container(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    height: 200.0,
                    width: 200.0,
                    image: AssetImage("images/upper_circle.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: color, fontSize: 30.0),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: textStyle,
                      controller: email,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please entre email';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Entre your email',

                          fillColor: Color(0xFF158203),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)))),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    style: textStyle,
                    controller: password,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please entre password';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Entre your password',
                        labelStyle: textStyle,
                        fillColor: Color(0xFF158203),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 7,left:170),
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen(note, "ASEEM");
                        }));
                      },
                      color: color,
                      child: Text("LOGIN"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        "New User?Create an account",
                        style: TextStyle(color: color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


