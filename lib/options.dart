import "package:flutter/material.dart";
import 'package:marvinno/signup.dart';

import 'login.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = new Color(0xFF158203);
    return Scaffold(
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
                  padding: EdgeInsets.only(top: 58.0),
                  child: Text(
                    "Welcome To Marvinno",
                    style: TextStyle(color: color, fontSize: 30.0),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 170, top: 5.0),
                  child: Text(
                    "Bring Innovations to Life With Marvinno",
                    style: TextStyle(color: color, fontSize: 9.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 60.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: color,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignInScreen();
                            }));
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: color,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                          },
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  height: 170.0,
                  width: 170.0,
                  image: AssetImage("images/lower_circle.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
