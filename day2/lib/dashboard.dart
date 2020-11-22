import 'package:flutter/material.dart';
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
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Johny s Family",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15.0,
                        height: 1.2,
                    ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 15.0,
                        height: 1.2,
                    ),
                    ),
                     SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(29 , 0, 0, 0),
                      child: Center(
                        child: Text(
                          "What kind of questions",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 25.0,
                            height: 1.2,
                        ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(29 , 0, 0, 0),
                      child: Center(
                        child: Text(
                          "you want to solve?",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 25.0,
                            height: 1.2,
                        ),
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
            height: 40,
          ),
          
         GridDashboard()
        ],
      );
      
    
  }
}