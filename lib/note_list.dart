import 'package:flutter/material.dart';
import 'mynote.dart';
import 'note_page.dart';

class NoteList extends StatefulWidget {

  final List<Mynote> notedata;
  NoteList(this.notedata,{Key key});

  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait
        ?2
                :3),
      itemCount: widget.notedata.length == null ?0: widget.notedata.length,
      itemBuilder: (BuildContext context, int i){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context)=>NotePage(widget.notedata[i],false)));
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                      width: double.infinity,
                      child: Text(
                          widget.notedata[i].title, style: TextStyle(
                        fontSize: 18,fontWeight : FontWeight.bold
                      ),),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(widget.notedata[i].note, style:TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("Created : ${widget.notedata[i].createDate}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,bottom:8),
                    child: Text("Modified : ${widget.notedata[i].updateDate}"),
                  )
                ],
              ),
            ),
          );
      },
    );
  }
}