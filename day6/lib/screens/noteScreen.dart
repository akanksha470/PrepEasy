import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/model/note.dart';


class NoteScreen extends StatefulWidget {
 // static final String routeName = '/note';
  Note note;
  String username;
  NoteScreen(this.note, this.username);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Note note;
  String titleString = '';
  String noteString = '';

  Firestore _firestore = Firestore.instance;

  TextEditingController controllerTitle;
  TextEditingController controllerNote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    note = widget.note;
    if (note != null) {
      titleString = note.title;
      noteString = note.note;
    }

    controllerTitle =
        TextEditingController(text: note != null ? note.title : '');
    controllerNote = TextEditingController(text: note != null ? note.note : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          note != null ? 'Edit note' : 'Add note',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              saveClicked();
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              _firestore.collection('users').document(widget.username).collection('notes').document(note.id).delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: controllerTitle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              onChanged: (value) {
                titleString = value;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: controllerNote,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Note content'),
                onChanged: (value) {
                  noteString = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void saveClicked() {
    if (note == null) {
      _firestore.collection('users').document(widget.username).collection("notes").
      add({'title': titleString, 'note': noteString});
//      _firestore
//          .collection('notes')
//          .add({'title': titleString, 'note': noteString});
    } else {
      _firestore.collection('users').document(widget.username).collection("notes").document(note.id).
      updateData({'title': titleString, 'note': noteString});
//      _firestore
//          .collection('notes')
//          .document(note.id)
//          .updateData({'title': titleString, 'note': noteString});
    }
  }
}