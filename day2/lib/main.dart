import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';
import 'page1.dart';
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
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
      backgroundColor: Color(0xff392850),
      //appBar: AppBar(title: Text('PrepEasy'),),
      appBar: AppBar(
        leading: Icon(Icons.view_agenda), // you can put Icon as well, it accepts any widget.
        
        title: Text ("Your Title"),
        actions: [
            Icon(Icons.add),
            Icon(Icons.add),
        ],
      ),
         bottomNavigationBar: Container(
            color: Colors.blue,
            child: TabBar(

              tabs: [
                Tab(icon: Icon(Icons.event_note), text: '',),
                //Tab(icon: Icon(Icons.schedule), text: 'Today',),
                //Tab(icon: Icon(Icons.show_chart), text: 'Stats',)
              ],

            ),
          ),
          body: TabBarView(
            children: [page1()],
          ),
      
    )
    )
    );
  }
}