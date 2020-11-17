import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/screens/onboarding_screen.dart';
import 'package:flutter_onboarding_ui/screens/screen1.dart';
import 'package:flutter_onboarding_ui/screens/signin.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  LocalData localData = LocalData();
  bool isLoggedIn = false;

  autoLogin() async{
    print("Logged1 $isLoggedIn");
    if(await localData.getUserEmail() != null){
      setState(() {
        localData.saveUserLoggedIn(true);
        isLoggedIn = true;

      });
      print("Logged2 $isLoggedIn");
    }
  }

  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding UI',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? Home() : OnboardingScreen(),
    );
  }
}