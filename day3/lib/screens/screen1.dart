import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/screens/griddashboard.dart';
import 'package:flutter_onboarding_ui/screens/dashboard.dart';

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
              stops: [0.1],
              colors: [
                Color(0xFFF5B8D8),
//                Color(0xFF82ACFF),
//                Color(0xFF6297FF)
              ],
            ),
          ),
          child: DefaultTabController(
              length: 1,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                //appBar: AppBar(title: Text('PrepEasy'),),
                appBar: AppBar(
                  leading: Icon(Icons.dehaze), // you can put Icon as well, it accepts any widget.

                  title: Text("PrepEasy"),
                  actions: [
                    Icon(Icons.add),
                    Icon(Icons.add),
                  ],
                  backgroundColor: Color(0xFF071A3F),
                ),
                bottomNavigationBar: Container(
                  height: 70,
                  color: Color(0xFF071A3F),
                  child: TabBar(
                    tabs: [
                      Tab(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.event_note),
                        ),
                        text: '',
                      ),
                      //Tab(icon: Icon(Icons.schedule), text: 'Today',),
                      //Tab(icon: Icon(Icons.show_chart), text: 'Stats',)
                    ],
                  ),
                ),
                body: TabBarView(

                  children: [page1()],
                ),
              )),
        ));
  }
}
