import 'package:flutter_onboarding_ui/screens/favourites.dart';
import 'package:flutter_onboarding_ui/screens/onboarding_screen.dart';
import 'package:flutter_onboarding_ui/screens/screen1.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/subjects/english/antonym.dart';


class englishScreen extends StatefulWidget {
  @override
  _englishScreenState createState() => _englishScreenState();
}

class _englishScreenState extends State<englishScreen> {
  @override

  LocalData localData = LocalData();

  showLogoutDialog(BuildContext context) {

  AlertDialog alert = AlertDialog(
    title: Text("Log Out"),
    content: Text("Are you sure you want to log out?"),
    actions: <Widget>[
      FlatButton(
        child: Text("Yes"),
        onPressed: () async {
          Navigator.of(context, rootNavigator: true).pop();
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

    Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1],
          colors: [
//            Color(0xFFF5B8D8),
            Color(0xFFEB5FA9),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Color(0xFF071A3F),
            title: Text('ENGLISH'),
        ),
        body: BodyLayout(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
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
                decoration: BoxDecoration(
                  color: Color(0xFFEB5FA9),
                ),
              ),
            SizedBox(height: 20,),
              ListTile(
                title: Text('Dashboard'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              Divider(color: Colors.grey, thickness: 1,),
              ListTile(
                title: Text('Test'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(color: Colors.grey, thickness: 1,),
              ListTile(
                title: Text('Favourites'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen(false)));
                },
              ),
              Divider(color: Colors.grey, thickness: 1,),
              ListTile(
                title: Text('Logout'),
                onTap: () => showLogoutDialog(context),
              ),
              Divider(color: Colors.grey, thickness: 1,),
            ],
          ),
        )

      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}


Widget _myListView(BuildContext context) {

  final titles = ['Antonyms', 'Change of Speech', 'Completing Statements', 'Comprehension', 'Ordering of Words', 'Paragraph Formation',
     'Selecting words', 'Sentence correction', 'Synonyms'];

  final icons = [Icons.assignment, Icons.assignment, Icons.assignment, Icons.assignment, Icons.assignment,
    Icons.assignment, Icons.assignment, Icons.assignment, Icons.assignment,];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: Icon(icons[index], color: Color(0xFF071A3F)),
            title: Text(titles[index],
              style: TextStyle(
                color: Color(0xFF071A3F),
                fontFamily: "Poppins",
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),

          ),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => EnglishAntonym(titles[index].toLowerCase()))),
      );
    },
  );
}
