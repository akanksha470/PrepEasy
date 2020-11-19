import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/model/note.dart';
import 'package:flutter_onboarding_ui/screens/noteScreen.dart';
import 'package:flutter_onboarding_ui/services/database.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter_onboarding_ui/services/note_card.dart';

class NotesStream extends StatefulWidget {
  final Firestore _firestore;
  NotesStream({firestore}) : _firestore = firestore;

  @override
  _NotesStreamState createState() => _NotesStreamState();
}

class _NotesStreamState extends State<NotesStream> {

  DatabaseMethods databaseMethods = DatabaseMethods();
  var username;
  LocalData localData = LocalData();
  Stream noteStream;

//  getUserInfo() async{
//    username = localData.getUserName();
//  }

  getNotes() async{
    username = await localData.getUserName();
    databaseMethods.getNotes(username).then((val){
      setState(() {
        noteStream = val;
      });
    });
  }

  @override
  void initState() {
    getNotes();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder (
      stream: noteStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(),
            );
        }

        final notes =  snapshot.data.documents;
        List<NoteCard> noteCards = [];
        for (var note in notes) {
          Note noteObject =
          Note(id: note.documentID, title: note.data['title'], note: note.data['note']);
          noteCards.add(NoteCard(
            note: noteObject,
            onPressed: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) => NoteScreen(noteObject, username)));
            },
          ));
        }

        return Column(
          children: noteCards,
        );
      },
    );
  }
}