import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget{
  @override
  _UserInfo createState() => _UserInfo();
}

class _UserInfo extends State<UserInfo> {
  TextEditingController name = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[

                Image(
                  image: AssetImage("images/imgone.jpeg"),
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  color: Color(0XFFFFFFFF),
                  child: Column(
                    children: <Widget>[

                      Center(child: Text("Profile",style: TextStyle(color: Colors.black,fontSize: 30.0),),),

                      Container(padding:EdgeInsets.only(top:15.0,bottom: 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("User Name",style: TextStyle(color: Colors.black,fontSize: 20.0),))),

                      Container(padding:EdgeInsets.all(5.0),child: Align(alignment:Alignment.centerLeft,child: Text("marvinno",style: TextStyle(color: Colors.black,fontSize: 10.0),))),

                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Email id:",style: TextStyle(color: Colors.black,fontSize: 20.0),))),

                      Container(padding:EdgeInsets.all(5.0),child: Align(alignment:Alignment.centerLeft,child: Text("marvinno123@gmail.com",style: TextStyle(color: Colors.black,fontSize: 10.0),))),

                    ],
                  ),
                ),


                Container(
                  margin: EdgeInsets.all(20.0),
                  color: Color(0XFFFFFFFF),
                  child: Column(
                    children: <Widget>[

                      Center(child: Text("About Us",style: TextStyle(color: Colors.black,fontSize: 25.0),),),

                      Container(
                          padding:EdgeInsets.only(top:15.0),
                          child: Align(
                              child: Text(
                                "Marvinno is a leading provider of cutting-edge technologies and services,offering scalable IOT solutions and software services as per reuirement. Marvinno is creating technology for advancement of human beings. We know hoe to analyse this information and customize our offerings to changing market needs. Why not join our fast growing customer base? Get in touch today to learn more about our story. ",
                                style: TextStyle(
                                    color: Colors.black,fontSize: 15.0
                                ),))),

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  color: Color(0XFFFFFFFF),
                  child: Column(
                    children: <Widget>[

                      Center(child: Text("Frequently Asked Questions",style: TextStyle(color: Colors.black,fontSize: 24.0),),),

                      Container(padding:EdgeInsets.only( top:15,bottom: 5.0,left: 5.0,right: 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Q. How to connect my device to a hotspot named 'A' while it is already connected to another hotspot named 'B'?",style: TextStyle(color: Colors.black,fontSize: 17.0),))),

                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Ans. Turn off hotspot 'B', then press RESET button, then connect device to smartfone using app,lastly put the credentials of hotspot 'A' int he app to connect the device.",style: TextStyle(color: Colors.black,fontSize: 14.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Q. Do I always have to connect my device to hotspot mannually each time the device switches ON?",style: TextStyle(color: Colors.black,fontSize: 17.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Ans. No, once a device is connected to a hotspot,it will automaticall connect itself with the hotspot everytime it switche ON or RESET button is presseed.",style: TextStyle(color: Colors.black,fontSize: 14.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Q. Can I Connect my device to other hotspot?",style: TextStyle(color: Colors.black,fontSize: 17.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Ans. No, you need to press reset button ads device connect perform both as wifi and hotspot simultaneously.",style: TextStyle(color: Colors.black,fontSize: 14.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Q. Is there any inertial time delay in device to function?",style: TextStyle(color: Colors.black,fontSize: 17.0),))),


                      Container(padding:EdgeInsets.all( 5.0),child: Align(alignment:Alignment.centerLeft,child: Text("Ans. Yes, there is an inertial time delay of approx 15s in device to function each time it switches ON or RESET button is pressed.",style: TextStyle(color: Colors.black,fontSize: 14.0),))),


                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(20.0),
                  color: Color(0XFFFFFFFF),
                  child: Column(
                    children: <Widget>[

                      Center(child: Text("Contact Us",style: TextStyle(color: Colors.black,fontSize: 30.0),),),

                        Image(
                          height: 60.0,
                          image: AssetImage("images/icon.png"),
                        ),

                      Center(child: Text("OWNED BY MARVELEOUS INNOVATIONS",style: TextStyle(color: Colors.black,fontSize: 15.0),),),

                      Center(child: Text("www.marvinno.in",style: TextStyle(color: Colors.black,fontSize: 10.0),),),

                      Center(child: Text("info.marvinno@gmail.com",style: TextStyle(color: Colors.black,fontSize: 10.0),),),

                      Center(child: Text("+91 837 603 5606",style: TextStyle(color: Colors.black,fontSize: 10.0),),),

                    ],
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