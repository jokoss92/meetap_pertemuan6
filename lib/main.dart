import 'package:flutter/material.dart';
import 'note_page.dart';
import 'DBHelper.dart';
import 'note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetAp Note for Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var db = DBHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.border_color),
          title: Text("Note Project"),
          backgroundColor: Colors.lightGreen,
        ),
        floatingActionButton: FloatingActionButton(
//        onPressed: () => Navigator.of(context).push(
//            MaterialPageRoute(builder: (BuildContext context) =>
//                NotePage(null,true))),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.lightGreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[],
            ),
          ),
        ),
        backgroundColor: Colors.grey,
        body: FutureBuilder(
          future: db.getNote(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            var data = snapshot.data;
            return snapshot.hasData
                ? new NoteList(data)
                : Center(
                    child: Text("No Data"),
                  );
          },
        ));
  }
}
