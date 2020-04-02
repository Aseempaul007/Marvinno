import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvinno/options.dart';

class AddDevices extends StatefulWidget{
  @override
  _AddDevicesState createState() => _AddDevicesState();
}

class _AddDevicesState extends State<AddDevices> {
  TextEditingController productId = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            elevation: 6.0,
            backgroundColor: Colors.white,
            title: Text(
              "ADD DEVICES",
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  debugPrint("notification button id pressed");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OptionsScreen();
                  }));
                },
                child:

                Container(
                  height: 40.0,
                  child: Image(
                    image: AssetImage("images/logout.png"),
                  ),
                ),
              ),
            ],
          ),
          resizeToAvoidBottomPadding: false,
          body: Container(
            child: Column(
              children: <Widget>[

                Expanded(child:(Container(padding:EdgeInsets.only(top:40.0),child: Text("Enter your product id",style: TextStyle(color: Colors.black,fontSize: 30.0),))),),
                (Container(padding:EdgeInsets.all(20.0),child: Text("Once you register your device,you can start operating your device bu scanning QRcode",style: TextStyle(color: Colors.black,fontSize: 18.0),))),

                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                          controller: productId,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please entre prodict id';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Product ID',

                              fillColor: Color(0xFF158203),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                    )),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
                        color: Color(0xFF158203),
                        onPressed: () {
                        debugPrint("signup is tapped");
                      },
                      child: Text(
                          "REGISTER",
                        style: TextStyle(
                        ),
                      ),
                    ),
                  ),
                ),


                (Container(padding:EdgeInsets.only(top:5.0,bottom: 10.0),child: Text("For mor info>>",style: TextStyle(color: Colors.black,fontSize: 15.0),))),

                (Container(padding:EdgeInsets.only(top:5.0),child: Text("Information",style: TextStyle(color: Colors.black,fontSize: 30.0),))),

                Expanded(
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage("images/pfo.jpg"),
                    ),
                  ),
                ),

                (Container(padding:EdgeInsets.all(20.0),child: Text("You can find your device serial id on the rigt bottom of yourdevice box. Pleasr save this id for future use.",style: TextStyle(color: Colors.black,fontSize: 15.0),))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}