import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/model/note.dart';
import 'package:flutter_onboarding_ui/screens/noteScreen.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter_onboarding_ui/services/note_stream.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  final bool isScrolled;

  const NotesScreen(this.isScrolled, {Key key}) : super(key: key);
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

    String username;
    Note note;
    final Firestore _firestore = Firestore.instance;
    LocalData localData = LocalData();

    getInfo() async{
      username = await localData.getUserName();
    }

    @override
  void initState() {
    // TODO: implement initState
      getInfo();
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: widget.isScrolled ? AppBar(
          backgroundColor: Color(0xFFEB5FA9),
          title: Center(child: Text("Notes", style: TextStyle(color: Colors.white, fontSize: 20,
              fontWeight: FontWeight.w600))),
        ) : AppBar(
          backgroundColor: Color(0xFF071A3F),
          title: Text("PrepEasy"),
        ),
        body: ListView(
          children: <Widget>[
            Visibility(
                visible: !widget.isScrolled, //Default is true,
                child: Row(
                  children: <Widget>[
                    Container(child: Center(child: Text("Notes", style: TextStyle(color: Colors.white, fontSize: 20,
                    fontWeight: FontWeight.w600))),
                    height: 60,
                     width: MediaQuery.of(context).size.width,
                    color: Color(0xFFEB5FA9),),

                  ],
                )
            ),
            NotesStream(firestore: _firestore)],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen(note, username)));
          },
          backgroundColor: Color(0xFFEB5FA9),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      );
    }

  }


