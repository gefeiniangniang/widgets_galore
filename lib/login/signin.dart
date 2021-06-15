import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signal_main/login/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:signal_main/server/server_demo_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:at_demo_data/at_demo_data.dart' as at_demo_data;
import 'package:signal_main/home/home_screen.dart';

String atSign;

class LoginPage extends StatefulWidget {
  static final String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _LoginPageState extends State<LoginPage> {
  //bool showSpinner = false;
  TextEditingController _loginTextFieldController = TextEditingController();
  ServerDemoService _serverDemoService = ServerDemoService.getInstance();
  Color color1 = HexColor("45377D");
  Color color2 = HexColor("ACA6BF");
  Color color3 = HexColor("FFFFFF");

  @override
  Widget build(BuildContext context) {
    Gradient gradient = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color.fromRGBO(240, 128, 128, 1), Color.fromRGBO(0, 0, 0, 0)]);
    Shader shader = gradient.createShader(Rect.fromLTWH(0, 0, 2000, 1920));
    return new Scaffold(
      resizeToAvoidBottomInset: false,
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
          /*Container(
                // height: ,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("assets/assets/images/logo.png"),
                     //fit: BoxFit.cover,
                   ),
                 ),
               ),*/
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 55.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*Text(
                         '    ',
                         style: TextStyle(
                           color: Colors.lightGreen,
                               fontSize:50.0,
                         ),

                       ),*/
                  SizedBox(height: 95.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 23,
                        ),
                        child: Container(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      //   Text(
                      //     ' @Space\n       Signal ',
                      // //'Space\nSignal\n   👥',
                      //      style: //TextStyle(
                      //        GoogleFonts.quicksand(
                      //          fontWeight: FontWeight.w900,
                      //         color: color3,
                      //      // foreground: Paint()..shader=shader,
                      //       // color: Color(0x191970),
                      //        fontSize:50.0,
                      //      ),
                      //   ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        //alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: new BorderRadius.circular((20.0)),
                        ),
                        height: 57.0,
                        width: double.infinity,

                        child: TextField(
                          //keyboardType: TextInputType.text,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            // height: 1.9,
                            color: Colors.white,
                            fontSize: 17,
                          ),

                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: color2),
                                  borderRadius:
                                      new BorderRadius.circular((20.0))),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: color2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(0),

                              //prefixIcon: Icon(
                              // Icons.account_circle,
                              // size: 30,
                              // color: Colors.black,
                              // ),

                              hintText: 'Your @sign username',
                              hintStyle: TextStyle(
                                //height: 70,
                                color: Colors.white70,
                                fontSize: 15,

                                //height: -2,
                              )),

                          controller: _loginTextFieldController,
                          onChanged: (value) {
                            atSign = value;
                          },
                        ),
                      ),

                      Container(
                        //width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 1,
                        ),

                        child: MaterialButton(
                          onPressed: _login,
                          minWidth: double.infinity,

                          //padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: color3,
                          //Color c1 = Color(0xFFACA6BF),

                          child: Text(
                            'Sign in with your @sign',
                            style: TextStyle(
                                //  Color color1 = Color.HexColor("b74093");

                                color: color1,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //),
                      SizedBox(
                        height: 220,
                      ),
                      Container(
                        height: 15.0,
                        width: double.infinity,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                    // shadows: [
                                    // Shadow(
                                    //   blurRadius: 5.0,
                                    // color: Colors.black,
                                    //   offset: Offset(1, 1),
                                    //  ),
                                    // ],
                                  )),
                            ])),
                        /*TextSpan(
                                              text: 'Create an @sign account',
                                              style: TextStyle(
                                                decoration: TextDecoration.underline,
                                                color: color3,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 10.0,
                                                    color: Colors.black54,
                                                    offset: Offset(1.0, 1.0),
                                                  ),
                                                ],
                                              ))
                                        ]

                                    )),*/

                        /*child: Text("Create an @sign",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                            ))*/
                      ),
                      Container(
                        height: 60,
                        //width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          height: 50,
                          onPressed: _login,
                          minWidth: double.infinity,

                          //padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                          shape: RoundedRectangleBorder(
                            side: new BorderSide(color: color2),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          //color: Colors.black,
                          //Color c1 = Color(0xFFACA6BF),

                          child: Text(
                            'Create an @sign account',
                            style: TextStyle(
                                //  Color color1 = Color.HexColor("b74093");
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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

  void _login() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new HomeScreen()),
        (route) => route == null);
  }

  /*_login() async {
    FocusScope.of(context).unfocus();
    //setState(() {
    //  showSpinner = true;
    //});
    if (atSign != null) {
      _serverDemoService.onboard().then((value) {
        Navigator.pushNamed(context, HomeScreen.id);
      }).catchError((error) async {
        await _serverDemoService.authenticate(atSign,
            cramSecret: at_demo_data.cramKeyMap[atSign]);
        Navigator.pushNamed(context, HomeScreen.id);
      });
    }
  }

*/

}
