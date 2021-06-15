import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signal_main/home/home_screen.dart';
//import 'package:signal_main/signin.dart';
//import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static final String id = 'splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(milliseconds:1000 ), () {
      setState(() {
        _visible = !_visible;
      });

    });

    Future.delayed(Duration(milliseconds:3500 ), () {
      setState(() {
        _visible = !_visible;
      });

    });
    Future.delayed(Duration(seconds: 3), () {
      _splash();
    });

    return new Scaffold(
      backgroundColor: Colors.black,
      // set the background image
      /*body: Container(
            width: double.infinity,
            height: double.infinity,
            // color: Colors.yellow,
            child: Image.asset('assets/images/splash.png',
              fit: BoxFit.cover,
            )));*/
        body: Center(
            child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 900),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Container(
                width: double.infinity,
                height: double.infinity,

                child:Image.asset("assets/images/splash.png",
                  fit: BoxFit.cover,
                ),
              ),
            )));

  }



  void _splash() {
  Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(
          builder: (context) => HomeScreen()),
          (route) => route == null);
}
}

