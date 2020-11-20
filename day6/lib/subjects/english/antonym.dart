import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_onboarding_ui/model/data.dart';

class EnglishAntonym extends StatefulWidget {

  final String subtopic;

  const EnglishAntonym(this.subtopic, {Key key}) : super(key: key);
  @override
  _EnglishAntonymState createState() => _EnglishAntonymState();
}

class _EnglishAntonymState extends State<EnglishAntonym> {

  var sub;
  DatabaseReference referenceData;
 FirebaseAuth auth = FirebaseAuth.instance;
  List<Data> _dataList = List<Data>();
  List<bool> favList = [];
  bool isLoading;
  var i;

  getData() async {
    setState(() {
      isLoading = true;
      favList.clear();
      _dataList.clear();
    });
    //_dataList = List<Data>();
    await referenceData.once().then((DataSnapshot snapshot) async {
      print("Snap :  ${snapshot.value}");
      print("length: ${snapshot.value.length}");

      var len = snapshot.value.length;

      for (i = 0; i < len; i++) {
        var dataModel = Data();
        dataModel.id = snapshot.value[i]['id'];
        dataModel.ques = snapshot.value[i]['question'];
        dataModel.ans = snapshot.value[i]['answer'];
        dataModel.options = snapshot.value[i]['options'];

        _dataList.add(dataModel);

        await auth.currentUser().then((value) async {
          DatabaseReference reference = await FirebaseDatabase.instance
              .reference().child('english').child('antonyms')
              .child(_dataList[i].id).child('fav').child(value.uid).child(
              'state');

          await reference.once().then((DataSnapshot snapshot) {
            print("snapy : ${snapshot.value}");
            if (snapshot.value != null) {
              if (snapshot.value == true) {
                favList.add(true);
              }
              else {
                favList.add(false);
              }
            } else {
              favList.add(false);
            }
          });
        });
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print('subtopic: ${widget.subtopic}');
    sub = widget.subtopic;
    referenceData = FirebaseDatabase.instance.reference().child('english').child(widget.subtopic);
    i = 0;
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF071A3F),
        title: Text("PrepEasy"),

      ),

      body: !isLoading ?
          ListView(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Center(child: Text("English", style: TextStyle(color: Colors.white, fontSize: 20,
                        fontWeight: FontWeight.w600))),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFEB5FA9),
                  ),
                ],
              ),
              Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4,4,4,4),
                        child: Text("Directions to solve:\nIn the following questions, choose the word which is exact OPPOSITE of the given words"
                            , style: TextStyle(color: Colors.black, fontSize: 15,)),
                      ),
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.95,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _dataList == null ? 0 : _dataList.length,
                itemBuilder: (BuildContext context, int index) {
                 return QuestionsUI(_dataList[index].ques, _dataList[index].ans, _dataList[index].explanation, _dataList[index].options, index+1, favList[index]);
                  ListTile(
                      title: Text(_dataList[index].ques),
                      subtitle: Text(_dataList[index].ans),
                      trailing:
                      GestureDetector(
                        child: favList[index]
                            ? Icon(Icons.star, color: Colors.yellow)
                            :
                        Icon(Icons.star_border),
                        onTap: () async {
                          await auth.currentUser().then((value) {
                            DatabaseReference favRef = FirebaseDatabase.instance
                                .reference().child('english').child('antonyms')
                                .child(_dataList[index].id).child('fav').child(
                                value.uid).child('state');

                            favList[index] == true ? favRef.set(false) : favRef.set(
                                true);
                          });
                          setState(() {
                            favList[index] = !favList[index];
                          });
                        },)
                  );
                })],
          )
           : Center(child: CircularProgressIndicator(),),
    );
  }
}

class QuestionsUI extends StatefulWidget {

  String question, answer, explanation;
  var id;
  bool fav;
  List <dynamic> options;

  QuestionsUI(this.question, this.answer, this.explanation, this.options, this.id, this.fav);

  @override
  _QuestionsUIState createState() => _QuestionsUIState();
}

class _QuestionsUIState extends State<QuestionsUI> {

  FirebaseAuth auth = FirebaseAuth.instance;
  var button = "View Answer";
  //List<bool> favList = [];
  bool view = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Row(children: <Widget>[Text("${widget.id}")],),
                  flex: 2,
                ),
                Expanded(
                  child: Row(children: <Widget>[Text("${widget.question}")],),
                  flex: 12,
                ),
                Expanded(
                  child: Row(children: <Widget>[
                    GestureDetector(
                      child: widget.fav
                          ? Icon(Icons.star, color: Colors.yellow)
                          :
                      Icon(Icons.star_border),
                      onTap: () async {
                        await auth.currentUser().then((value) {
                          DatabaseReference favRef = FirebaseDatabase.instance
                              .reference().child('english').child('antonyms')
                              .child(widget.id - 1).child('fav').child(
                              value.uid).child('state');

                          widget.fav == true ? favRef.set(false) : favRef.set(
                              true);
                        });
                        setState(() {
                          widget.fav = !widget.fav;
                        });
                      },)
                  ],),
                  flex: 2,
                ),

              ],
            ),

            Row(children: <Widget>[
              Column(children: <Widget>[Text("A")],),
              SizedBox(width: 40,),
              Column(children: <Widget>[Text("${widget.options[0]}")],)
            ],),
            Row(children: <Widget>[
              Column(children: <Widget>[Text("B")],),
              SizedBox(width: 40,),
              Column(children: <Widget>[Text("${widget.options[1]}")],)
            ],),
            Row(children: <Widget>[
              Column(children: <Widget>[Text("C")],),
              SizedBox(width: 40,),
              Column(children: <Widget>[Text("${widget.options[2]}")],)
            ],),
            Row(children: <Widget>[
              Column(children: <Widget>[Text("D")],),
              SizedBox(width: 40,),
              Column(children: <Widget>[Text("${widget.options[3]}")],)
            ],),
            Row(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size(150, 40), // button width and height
                  child: Material(
                    color: Colors.orange, // button color
                    child: InkWell(
                      splashColor: Colors.green, // splash color
                      onTap: () {}, // button pressed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.call),
                          onPressed: (){
                            setState((){
                              view = !view;
                              if(view){
                                button = "Hide Answer";

                                //                               Explanation

                               }
                              else{
                                button = "View Answer";
                              }
                            });
                          },), // icon
                      Text("$button"), // text
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
                visible: view, //Default is true,
                child: Container(child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text("${widget.answer}")
                    ],),
                    Row(children: <Widget>[
                      Text("${widget.explanation}")
                    ],)
                  ],
                ))
            ),


          ],
        ),
      ),
    );
  }
}




