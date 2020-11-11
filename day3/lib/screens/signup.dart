import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding_ui/screens/screen1.dart';
import 'package:flutter_onboarding_ui/screens/signin.dart';
import 'package:flutter_onboarding_ui/services/localData.dart';
import 'package:flutter_onboarding_ui/services/database.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var email = TextEditingController();
  var pwd = TextEditingController();
  var user = TextEditingController();
  var formKey = GlobalKey<FormState>();
  QuerySnapshot isUsernamePresent;
  QuerySnapshot isEmailPresent;
  var num ;
  var numMail;
  var snackbar;

  LocalData localData = LocalData();
  DatabaseMethods databaseMethods = DatabaseMethods();

  bool isLoading = false;

  signup() async{
    var response = await checkUser(user.text.trim());
    setState(() {
      this.num = response;
    });

    var mail = await checkMail(email.text.trim());
    setState(() {
      this.numMail = mail;
    });
    if(formKey.currentState.validate()){
      print("validateddddddd");
      setState(() {
        isLoading = true;
      });

      try {
        print("bye byeeeeeeeeeeeeeeeeeeee");
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: pwd.text.trim());
        Map<String, String> userDataMap = {
          "userName": user.text.trim(),
          "userEmail": email.text.trim(),
        };

        await databaseMethods.addUserInfo(userDataMap, user.text.trim());

        await localData.saveUserName(userDataMap["userName"]);
        await localData.saveUserEmail(userDataMap["userEmail"]);
        await localData.saveUserLoggedIn(true);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));

      }
      on PlatformException catch(e){
        setState(() {
          isLoading = false;
        });
        if(e.code == 'email-already-in-use'){
          print("Errorrrrrrr ${e.code}");
          snackbar = SnackBar(
            backgroundColor: Colors.blue,
            content: Text("The email is already in use by other account"),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        }

        else if(e.code == 'weak-password'){
          print("Errorrrrrrr ${e.code}");
          snackbar = SnackBar(
            backgroundColor: Colors.blue,
            content: Text("The password is too weak"),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        }
      }
      catch (e){
        setState(() {
          isLoading = false;
        });
        print("Errorrrrrrr ${e.toString()}");
        snackbar = SnackBar(
          backgroundColor: Colors.blue,
          content: Text("Check your credentials"),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      }
    }
  }

  checkUser(userName) async{
    print("Hellooooooo $userName");
    await databaseMethods.searchForName1(userName.trim()).then((val){
      isUsernamePresent = val;
    });
    num = isUsernamePresent.documents.length;
    return num;
  }

  checkMail(mail) async{
    print("Hellooooooo $mail");
    await databaseMethods.searchForEmail(mail.trim()).then((val){
      isEmailPresent = val;
    });
    numMail = isEmailPresent.documents.length;
    print("Nummail  ================ $numMail");
    return numMail;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Sign Up"),
            backgroundColor: Color(0xFF071A3F),
          ),
          body: isLoading ? Container(
            child: Center(child: CircularProgressIndicator()),
          ) : Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/signup.png',
                  ),
                  height: 245.0,
                  width: 300.0,
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: email,
                            validator: (val) {
                              return val.isEmpty || numMail != 0 && numMail == 1 ? 'This email already exists' : null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Color(0xFF071A3F)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                )
                            ),
                          ),

                          TextFormField(
                            controller: user,
                            validator: (val) {
                              return val.isEmpty || num != 0 && num == 1 ? 'This username already exists' : null;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(color: Color(0xFF071A3F)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                )
                            ),
                          ),

                          TextFormField(
                            controller: pwd,
                            obscureText: true,
                            validator: (val) {
                              return val.length < 6 || val.isEmpty ?
                              "Enter Password 6+ characters" : null;
                            },
                            style: TextStyle(color: Color(0xFF071A3F)),
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Color(0xFF071A3F)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF071A3F))
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF071A3F),
                        ),
                        child: FlatButton(
                          child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: () => signup(),
                        ),

                      ),
                    ),

                    Text("Already have an account?", style: TextStyle(color: Color(0xFF071A3F), fontSize: 15),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF071A3F),
                        ),
                        child: FlatButton(
                          child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20)),
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                              builder: (context) => SignInPage(),
                            )
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
