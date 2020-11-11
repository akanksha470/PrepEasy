import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/utilities/styles.dart';
import 'griddashboard.dart';

class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 160,
            child: Center(
              child: Image(
                image: AssetImage(
                  'assets/images/logo.PNG',
                ),
                height: 250.0,
                width: 300.0,
              ),
            ),
          ),
//          SizedBox(
//            height: 110,
//          ),
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                      child: Center(
                        child: Text(
                          "What kind of questions",
                          style: dashboardFont
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Center(
                        child: Text(
                          "you want to solve?",
                          style: dashboardFont
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          
         GridDashboard()
        ],
      );
      
    
  }
}