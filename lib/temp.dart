/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signal_main/login/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:signal_main/server/server_demo_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import '../home/home_screen.dart';

String atSign;

class LoginPage extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //bool showSpinner = false;
  TextEditingController _loginTextFieldController = TextEditingController();
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();

  @override
  Widget build(BuildContext context) {
    Gradient gradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color.fromRGBO(240, 128, 128, 1), Color.fromRGBO(0, 0, 0, 0)]);
    Shader shader = gradient.createShader(Rect.fromLTWH(0, 0, 2000, 1920));
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.07),
                    BlendMode.hardLight), //dstATop
                image: AssetImage("assets/images/loginpage.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 100.0,
                vertical: 55.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*Text(
                         '    ',
                         style: TextStyle(
                           color: Colors.lightGreen,
                               fontSize:50.0,
                         ),

                       ),*/
                  SizedBox(height: 250.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '@signal ',
                        style: //TextStyle(
                        GoogleFonts.quicksand(
                          fontWeight: FontWeight.w500,
                          // color: Colors.black,
                          foreground: Paint()..shader = shader,
                          // color: Color(0x191970),
                          fontSize: 50.0,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular((20.0))),
                        height: 50.0,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                size: 30,
                                color: Colors.black,
                              ),
                              hintText: 'AtSign',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              )),
                          controller: _loginTextFieldController,
                          onChanged: (value) {
                            atSign = value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 2,
                        ),
                        child: RaisedButton(
                          onPressed: login,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.orange,
                          child: Text(
                            'Sign in with your @sign',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5.0,
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  )),
                              TextSpan(
                                  text: 'Create an @sign',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black54,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ))
                            ])),

                        /*child: Text("Create an @sign",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                            ))*/
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void login() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => SplashScreen()),
            (route) => route == null);
  }

/*
  _login() async {
    FocusScope.of(context).unfocus();
    //setState(() {
      //showSpinner = true;
    //});
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        Navigator.pushNamed(context, SplashScreen.id);
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            cramSecret: at_demo_data.cramKeyMap[atSign]);
        Navigator.pushNamed(context, SplashScreen.id);
      });
    }
  }

 */
}
*/