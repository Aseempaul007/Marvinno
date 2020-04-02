import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:marvinno/adddevices.dart';

import 'main_screen.dart';

class WebScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebviewScaffold(
        url: loadUrl,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(
            onPressed: (){
              debugPrint("signup is tapped");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return AddDevices();
                  }));
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text("BROWSER"),
        ),
      ),
    );
  }
}
