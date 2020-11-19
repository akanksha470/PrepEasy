import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/screens/dashboard.dart';
import 'package:flutter_onboarding_ui/screens/favourites.dart';
import 'package:flutter_onboarding_ui/screens/notes.dart';
import 'package:flutter_onboarding_ui/screens/onboarding_screen.dart';
import 'package:flutter_onboarding_ui/screens/test/test.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {

  LocalData localData = LocalData();

  showLogoutDialog(BuildContext context) {

    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to log out?"),
      actions: <Widget>[
        FlatButton(
          child: Text("Yes"),
          onPressed: () async {
            Navigator.of(context).pop();
            await localData.saveUserLoggedIn(false);
            await localData.saveUserName(null);
            await localData.saveUserEmail(null);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
          },
        ),
        FlatButton(
          child: Text("No"),
          onPressed:  () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Widget popUpMenu(){
    return PopupMenuButton(
      icon: Icon(Icons.account_circle),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: "logout",
          child: Row(
            children: <Widget>[
              Icon(Icons.exit_to_app, color: Colors.black,),
              SizedBox(width: 10,),
              Text("Log out"),
            ],
          ),
        )
      ],

      onSelected: (val){
        if(val == "logout"){
          showLogoutDialog(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4],
                colors: [
                  Color(0xFFF5B8D8),
                  Color(0xFFEB5FA9),
                  ],
              ),
          ),
          child: DefaultTabController(
              length: 4,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  //leading: Icon(Icons.dehaze), // you can put Icon as well, it accepts any widget.

                  title: Text("PrepEasy"),
                  actions: [
                    popUpMenu()
                  ],
                  backgroundColor: Color(0xFF071A3F),
                ),
                bottomNavigationBar: Container(
                  height: 70,
                  color: Color(0xFF071A3F),
                  child: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.dashboard),
                      ),
                      Tab(icon: Icon(Icons.star),),
                      Tab(icon: Icon(Icons.note), ),
                      Tab(icon: Icon(Icons.local_library), )
                    ],
                  ),
                ),
                body: TabBarView(

                  children: [page1(), FavouriteScreen(true), NotesScreen(), TestScreen()],
                ),
              )),
        ));
  }
}
