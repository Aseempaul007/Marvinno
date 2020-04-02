import 'package:flutter/material.dart';
import 'package:marvinno/main_screen.dart';
import 'data.dart';
import 'login.dart';
import 'options.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Data note;
    Color color = new Color(0xFF158203);

    TextEditingController name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController mob = new TextEditingController();
    TextEditingController password = new TextEditingController();
    TextEditingController confPassword = new TextEditingController();
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
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
                    "SIGNUP",
                    style: TextStyle(color: color, fontSize: 30.0),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: textStyle,
                    controller: name,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please entre Name';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Name',
                        fillColor: Color(0xFF158203),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)))),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  style: textStyle,
                  controller: email,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please entre Email Id';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Email id',
                      fillColor: Color(0xFF158203),
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: textStyle,
                    controller: mob,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please entre Mobile NO';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Mobile No',
                        fillColor: Color(0xFF158203),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)))),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  style: textStyle,
                  controller: password,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please entre Password';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Color(0xFF158203),
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: textStyle,
                    controller: confPassword,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Confirm your Pasword';
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        fillColor: Color(0xFF158203),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)))),
              )),
              Container(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                  onPressed: () {
                    debugPrint("signup is tapped");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainScreen(note, "ASEEM");
                    }));
                  },
                  color: color,
                  child: Text("SIGNUP"),
                ),
              ),
              Expanded(
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignInScreen();
                      }));
                    },
                    child: Text(
                      "Already Signup?Login",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void moveToLastScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return OptionsScreen();
    }));
  }
}
