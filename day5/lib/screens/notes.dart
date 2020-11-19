import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/model/note.dart';
import 'package:flutter_onboarding_ui/screens/noteScreen.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter_onboarding_ui/services/note_stream.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
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
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Notes'),
        ),
        body: ListView(
          children: <Widget>[NotesStream(firestore: _firestore)],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen(note, username)));
          },
          backgroundColor: Color(0xFF071A3F),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      );
    }

  }


