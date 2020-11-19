import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/model/note.dart';


class NoteCard extends StatelessWidget {
  final Note note;
  final Function onPressed;

  NoteCard({this.note, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.note),
        ),
      ),
    );
  }
}