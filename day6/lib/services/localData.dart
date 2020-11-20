import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class LocalData{

  static String isLoggedInKey = "isLoggedIn";
  static String usernameKey = "username";
  static String emailKey = "email";

  Future<void> saveUserLoggedIn (bool isLoggedIn) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(isLoggedInKey, isLoggedIn);
  }

  Future<void> saveUserName (String username) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(usernameKey, username);
  }

  Future<void> saveUserEmail (String email) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(emailKey, email);
  }


  Future<bool> getUserLoggedIn () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(isLoggedInKey);
  }

  Future<String> getUserName () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(usernameKey);
  }

  Future<String> getUserEmail () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(emailKey);
  }

}