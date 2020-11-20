import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_onboarding_ui/model/data.dart';

class FavouriteScreen extends StatefulWidget {
  final bool isScrolled;

  const FavouriteScreen(this.isScrolled, {Key key}) : super(key: key);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  DatabaseReference referenceData = FirebaseDatabase.instance.reference().child(
      'english').child('antonyms');
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Data> _dataList = List<Data>();
  List<Data> favList = [];
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
                favList.add(dataModel);
              }
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
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  widget.isScrolled ? AppBar(
        backgroundColor: Color(0xFFEB5FA9),
        title: Center(child: Text("Favourites", style: TextStyle(color: Colors.white, fontSize: 20,
            fontWeight: FontWeight.w600)))
      ) : AppBar(
        backgroundColor: Color(0xFF071A3F),
        title: Text("PrepEasy"),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(),) :
      Column(
        children: <Widget>[
          //!widget.isScrolled ? Row() : null,
      Visibility(
      visible: !widget.isScrolled, //Default is true,
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEB5FA9),
            child: Center(child: Text("Favourites", style: TextStyle(color: Colors.white, fontSize: 20,
                fontWeight: FontWeight.w600))),
          ),

        ],
      )
    ),
          ExpansionTile(
            title: Text("English"),
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: favList == null ? 0 : favList.length,
                  itemBuilder: (BuildContext context, int index){
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(favList[index].ques),
                    ),
                    Divider()
                  ],
                );
              })
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