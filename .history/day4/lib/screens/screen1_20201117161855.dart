import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_onboarding_ui/screens/griddashboard.dart';
import 'package:flutter_onboarding_ui/screens/dashboard.dart';
import 'package:flutter_onboarding_ui/screens/favourites.dart';
import 'package:flutter_onboarding_ui/screens/notes.dart';
import 'package:flutter_onboarding_ui/screens/test/test.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
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
                //appBar: AppBar(title: Text('PrepEasy'),),
                appBar: AppBar(
                  //leading: Icon(Icons.dehaze), // you can put Icon as well, it accepts any widget.

                  title: Text("PrepEasy"),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.account_circle),
                    ),
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

                  children: [page1(), FavouriteScreen(), NotesScreen(), TestScreen()],
                ),
              )),
        ));
  }
}
