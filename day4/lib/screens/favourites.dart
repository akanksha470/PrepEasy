import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text("English"),
            children: <Widget>[
            ],
          ),
          ExpansionTile(
            title: Text("Technical"),
            children: <Widget>[
            ],
          ),
          ExpansionTile(
            title: Text("Quantitative"),
            children: <Widget>[],
          ),
          ExpansionTile(
            title: Text("Logical Reasoning"),
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}

// data['english']['antonyms'][index]['favourite'] = true