import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_ui/screens/signin.dart';
import 'package:flutter_onboarding_ui/utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 3.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF142548) : Color(0xFFF5B8D8),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071A3F),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,

        child: Stack(

          children: [
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              height: 150,

              child: Column(

                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Text("Welcome to PrepEasy", style: bTitleStyle), ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Text("Welcome toPrepEasy", style: bSubtitleStyle),),
                    ],
                  ),
                  SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFEB5FA9), width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFF6380E3),
                        ),
                        child: FlatButton(
                          child: Text("Get In", style: buttonSubtitleStyle),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 230.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(150), topRight: Radius.circular(150), ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFFF5B8D8),
                  Color(0xFFEB5FA9),
                  Color(0xFFE53793),
                  Color(0xFFBC0F6A),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Container(
                    height: 520.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding0.png',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Difficult to find\napt questions?',
                                  style: kTitleStyle,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Get the topic wise question bank along with its explanation.',
                                style: kSubtitleStyle, textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding1.png',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Wanna analyse\nyourself?',
                                  style: kTitleStyle, textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Take a test of whichever topic you feel like.',
                                style: kSubtitleStyle, textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding2.png',
                                  ),
                                  height: 250.0,
                                  width: 300.0,
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Forget the important\npoints when needed?',
                                  style: kTitleStyle, textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Note it down in the notes section and bookmark the interesting problems',
                                style: kSubtitleStyle, textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}