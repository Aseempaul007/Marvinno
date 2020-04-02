import 'package:app_settings/app_settings.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvinno/user_info.dart';
import 'package:marvinno/web_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'adddevices.dart';
import 'data.dart';
import 'database.dart';
import 'list.dart';



String loadUrl = "";
bool showDialog = false;

TextEditingController titleController = TextEditingController();

class MainScreen extends StatefulWidget {
  final Data note;
  final String appBarTitle;

  MainScreen(this. note, this.appBarTitle);


  @override
  _MainScreenState createState() => _MainScreenState(this.note, this.appBarTitle);
}
class _MainScreenState extends State<MainScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  _MainScreenState(this.note, this.appBarTitle);

  List<Data> noteList;
  int count = 0;
  Data note;
  TextEditingController textEditingController = new TextEditingController();
  DatabaseHelper helper = new DatabaseHelper();

  String appBarTitle;



  Future scanQr() async {
    String barcodeScanRes = await BarcodeScanner.scan();
    loadUrl = barcodeScanRes;
    return loadUrl;
  }


  void moveToLastScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteList();
    }));
  }
  // Save data to database
  void _save() async {
    int result;
    if (note.id != null) {  // Case 1: Update operation
      result = await helper.updateNote(note);
    } else { // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

  }


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

  }


  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Data>();
      updateListView();
    }
    return Scaffold(
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FloatingActionButton(
          tooltip: "my floating button",
          elevation: 8.0,
          child: Image(
            image: AssetImage("images/qr.png"),
          ),
          onPressed: () {
            scanQr();
            updateListView();
            debugPrint("Floating button is pressed");
            setState(() {
              if(loadUrl=null){showDialog =true;}
            });
          },
        ),
      ),
      appBar: AppBar(
        elevation: 6.0,
        backgroundColor: Colors.white,
        title: Text(
          "Marvinno",
          style: TextStyle(
              color: Colors.black54
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              debugPrint("notification button id pressed");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserInfo();
              }));
            },
            icon: Icon(
              Icons.info,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[

          Container(
            height: 120.0,
            color: Colors.green,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("wifi settings has been tapped");
                      AppSettings.openWIFISettings();
                    },
                    child: GestureDetector(
                      child: Image(
                        height: 80.0,
                        image: AssetImage("images/wifiimage.png"),

                      ),
                    ),
                  ),
                ),


                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("add devices has been tapped");
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return AddDevices();
                      }));
                    },
                    child: Image(
                      height: 70.0,
                      image: AssetImage("images/addimg.jpeg"),
                    ),
                  ),
                )
              ],
            ),
          ),


          Container(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                "Marvinno Devices",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),

          showDialog==true?
          AlertDialog(
            content: TextField(
              controller:  titleController,
              onSubmitted: (String string){

              },
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("ADD"),
                onPressed: (){
                  setState(() {
                    showDialog = false;
                    _save();
                  });
                },
              )
            ],
            title: Text(
                "ADD BUTTON"
            ),
          ):Text(""),

          Container(
            child: getNoteListView(),
            height: 350.0,
          )
        ],
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Data>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  ///////////////////////////////////////////////////////////////////////////////////////


  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              this.noteList[position].title,
              style: titleStyle,
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, noteList[position]);
              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebScreen();
              }));
            },
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Data note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Data note) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(note, "");
    }));

    if (result == true) {
      updateListView();
    }
  }


}