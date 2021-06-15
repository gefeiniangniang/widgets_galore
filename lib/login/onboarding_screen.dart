import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  static final String id = 'onboarding';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // List<Widget> _buildPageIndicator() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < _numPages; i++) {
  //     list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  //   }
  //   return list;
  // }

  // Widget _indicator(bool isActive) {
  //   return AnimatedContainer(
  //     duration: Duration(milliseconds: 150),
  //     margin: EdgeInsets.symmetric(horizontal: 8.0),
  //     height: 8.0,
  //     width: isActive ? 24.0 : 16.0,
  //     decoration: BoxDecoration(
  //       color: isActive ? Colors.white : Color(0xFF7B51D3),
  //       borderRadius: BorderRadius.all(Radius.circular(12)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          AnnotatedRegion(
            child: Column(
              children: <Widget>[
                Container(
                  //TODO:在这里加padding
                  padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                  height: 440,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      //第一页
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Hey there',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Text(
                                'Welcome \nIt\'s a pleasure to connect with you in the vast universe.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.51),
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //第二页
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'May I have your name, please?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: TextField(
                                onChanged: (value /*String str*/) {
                                  // TODO: do something with user input
                                  //var = str bla bla
                                },
                                //Input Style
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  //TODO:decorate the text field and add a text below.
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _currentPage != _numPages - 1
                    ? Container(
                        //TODO: add EdgetInsert
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,

                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        //TODO: add EdgetInsert
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,

                            children: <Widget>[
                              Text(
                                'Started',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
            value: SystemUiOverlayStyle,
          )
        ],
      ),
    );
  }
}
