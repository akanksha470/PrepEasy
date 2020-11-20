import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter_onboarding_ui/utilities/styles.dart';
import 'package:flutter_onboarding_ui/subjects/english/eng.dart';
import 'package:flutter_onboarding_ui/subjects/quantitative/quant.dart';
import 'package:flutter_onboarding_ui/subjects/technical/tech.dart';


class page1 extends StatefulWidget {
  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                    Center(
                      child: Text(
                        "What kind of questions",
                        style: dashboardFont
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Center(
                      child: Text(
                        "you want to solve?",
                        style: dashboardFont
                      ),
                    ),
                  ],
                ),

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

class GridDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      //         0xffC14999
                      color: Color(0xffF8F2FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "English",
                        style: TextStyle(
                          color: Color(0xFF142548),
                          fontFamily: "Poppins",
                          fontSize: 15.0,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) => englishScreen())),
              ),

              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      //         0xffC14999
                      color: Color(0xffF8F2FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Quantitative",
                        style: TextStyle(
                          color: Color(0xFF142548),
                          fontFamily: "Poppins",
                          fontSize: 15.0,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Quantitative())),
              ),

              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      //         0xffC14999
                      color: Color(0xffF8F2FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Technical",
                        style: TextStyle(
                          color: Color(0xFF142548),
                          fontFamily: "Poppins",
                          fontSize: 15.0,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                onTap: () =>  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TechScreen())),
              ),

              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                      //         0xffC14999
                      color: Color(0xffF8F2FF),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Logical Reasoning",
                        style: TextStyle(
                          color: Color(0xFF142548),
                          fontFamily: "Poppins",
                          fontSize: 15.0,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                onTap: () =>  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Quantitative())),
              ),
            ]
        ));
  }
}

class Items {
  String title;
  String subtitle;

  Items({this.title, this.subtitle});
}
