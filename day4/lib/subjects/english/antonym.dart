import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnglishAntonym extends StatefulWidget {
  @override
  _EnglishAntonymState createState() => _EnglishAntonymState();
}

class _EnglishAntonymState extends State<EnglishAntonym> {

//  final List<Country> country;
//  CountyList({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/questions.json'),
            builder: (context, snapshot){
            var data = json.decode(snapshot.data.toString());
            print("data: $data");
            return ListView.builder(
                itemCount: data == null ? 0 : data["english"]['antonyms'].length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Ques: " + data['english']['antonyms'][index]['question']),
                        Text("Ans: " + data['english']['antonyms'][index]['answer'])
                        //Text("Ans: " + data[index]['english']['antonyms']['answer']),
                      ],
                    ),
                  );
                });
            },
        ),
      ),
    );
  }
}
