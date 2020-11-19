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
      body: !isLoading ? ListView.builder(
          itemCount: _dataList == null ? 0 : _dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
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
          })
           : Center(child: CircularProgressIndicator(),),
    );
  }
}

