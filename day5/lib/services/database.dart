import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData, String username) async {
    Firestore.instance.collection("users").document(username).setData(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return Firestore.instance.collection("users").where("userEmail", isEqualTo: email).getDocuments().catchError((e) {
      print(e.toString());
    });
  }

  searchForName1(String user) async{
    var result =  await Firestore.instance.collection("users").limit(1).where('userName', isEqualTo: user).getDocuments();
    return result;
  }

  searchForEmail(String mail) async{
    var result = await Firestore.instance.collection("users").limit(1).where('userEmail', isEqualTo: mail).getDocuments();
    return result;
  }

  getNotes(String username) async{
    var result = await Firestore.instance.collection('users').document(username).collection('notes').snapshots();
    var r = await Firestore.instance.collection('users').snapshots();
    print("rrrrrrrrrrrrrrr : $r");
    return result;
  }
}