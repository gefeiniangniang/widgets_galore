import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signal_main/login/signin.dart';
import 'package:signal_main/chat/chat_list.dart';
import 'package:signal_main/home/fabbottomappbar.dart';
import '../chat/chat_screen.dart';
import '../chat/message_model.dart';
import 'package:signal_main/home/profile.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//transform the color codes
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

// main page, popups, menu
class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ProgressDialog progressDialog;

// find a signal pop up
  Future<String> searchingPage(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible:
            false, // can not be closed by clicking outside border
        builder: (context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(
                left: 0,
                top: 10,
                right: 0,
                bottom: 0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              content: Container(
                  height: 340,
                  width: 300,
                  child: Column(
                      //overflow: Overflow.visible,
                      // alignment: Alignment.center,
                      children: <Widget>[
                        // Positioned(
                        //   right: 0.0,
                        // child:
                        Container(
                          alignment: Alignment.topRight,
                          height: 30,
                          width: 300,
                          child: FloatingActionButton(
                            //FloatingActionButton(
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,

                            mini: true,
                            elevation: 0.0,
                          ),
                        ),
                        // ),
                        Container(
                          height: 40,
                          child: Text(
                            "You got a signal!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.patuaOne(
                              //quicksand  patuaOne
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF45377D),
                              fontSize: 25,
                            ),
                          ),
                        ),

                        Container(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              top: 10,
                              right: 15,
                              bottom: 0,
                            ),
                            height: 260,
                            child: Column(
                                //新建一个Column来放文字信息，发件人名字和最近信息
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, //左对齐
                                children: [
                                  Container(
                                    height: 3,
                                    width: 50,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 0,
                                        right: 10,
                                        bottom: 0,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Icon(Icons.format_quote,
                                          color: Colors.grey)),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 30.0,
                                      top: 0,
                                      right: 30,
                                      bottom: 0,
                                    ),
                                    height: 120,
                                    width: 400,
                                    child: Text(
                                      "If you love a flower that lives on a star, it is sweet to look at the sky at night.",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF584797)),
                                      maxLines: null,
                                    ),
                                  ),
                                  // controller: controller,
                                  //  onChanged: (String value)async{if(value!=''){return _hascontent=true; }},
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 0,
                                        right: 10,
                                        bottom: 0,
                                      ),
                                      alignment: Alignment.bottomRight,
                                      child: Icon(Icons.format_quote,
                                          color: Colors.grey)),
                                  Container(
                                    height: 20,
                                    width: 320,
                                  ),
                                  Container(
                                      height: 50,
                                      width: 320,
                                      child: Row(children: <Widget>[
                                        Container(
                                            width: 130,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              // boxShadow: <BoxShadow>[
                                              // BoxShadow(
                                              // color: Colors.grey.withOpacity(0.1),
                                              // blurRadius: 0.5,
                                              // offset: Offset(0.0, 1)),
                                              //],
                                            ),
                                            child: RaisedButton(
                                                //MaterialButton(
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  // side: BorderSide(color: Colors.white)
                                                ),
                                                //elevation: 5.0,
                                                //minWidth: 320,
                                                // height: 50,
                                                color: Colors
                                                    .white, //:Colors.grey,
                                                //padding: EdgeInsets.symmetric(vertical: 15.0),
                                                onPressed: () {
                                                  // Navigator.of(context).pop(controller.text.toString());
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Discard",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFF8F8E94),
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                        Container(
                                          width: 10,
                                          height: 80,
                                        ),
                                        Container(
                                            width: 130,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    blurRadius: 0.5,
                                                    offset: Offset(0.0, 1)),
                                              ],
                                            ),
                                            child: RaisedButton(
                                                //MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color:
                                                            Color(0xFF584797))),
                                                elevation: 5.0,
                                                //minWidth: 320,
                                                // height: 50,
                                                color: Color(
                                                    0xFF584797), //:Colors.grey,
                                                //padding: EdgeInsets.symmetric(vertical: 15.0),
                                                onPressed: () {
                                                  // Navigator.of(context).pop(controller.text.toString());
                                                  sendingImage(context);
                                                  _chatscreen();
                                                },
                                                child: Text(
                                                  "Reply",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                      ]))
                                ]))
                      ])));
        });
  }

  final Message chat = chats[0];

  void _chats() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => ChatScreen(
                  user: chat.sender,
                )),
        (route) => route == null);
  }

//searching error popup
  void errorPage1(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            false, // can not be closed by clicking outside border
        builder: (context) {
          return AlertDialog(
              contentPadding: EdgeInsets.only(
                left: 0,
                top: 10,
                right: 0,
                bottom: 0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              content: Container(
                  height: 340,
                  width: 300,
                  child: Column(
                      //overflow: Overflow.visible,
                      // alignment: Alignment.center,
                      children: <Widget>[
                        // Positioned(
                        //   right: 0.0,
                        // child:
                        Container(
                          alignment: Alignment.topRight,
                          height: 30,
                          width: 300,
                          child: FloatingActionButton(
                            //FloatingActionButton(
                            child: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,

                            mini: true,
                            elevation: 0.0,
                          ),
                        ),
                        // ),
                        Container(
                          height: 40,
                          child: Text(
                            "Oops!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.patuaOne(
                              //quicksand  patuaOne
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF45377D),
                              fontSize: 25,
                            ),
                          ),
                        ),

                        Container(
                            padding: EdgeInsets.only(
                              left: 15.0,
                              top: 10,
                              right: 15,
                              bottom: 0,
                            ),
                            height: 260,
                            child: Column(
                                //新建一个Column来放文字信息，发件人名字和最近信息
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, //左对齐
                                children: [
                                  Container(
                                    height: 3,
                                    width: 50,
                                    color: Colors.grey[300],
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 0,
                                        right: 10,
                                        bottom: 0,
                                      ),
                                      alignment: Alignment.topLeft,
                                      child: Icon(Icons.format_quote,
                                          color: Colors.grey)),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 30.0,
                                      top: 0,
                                      right: 30,
                                      bottom: 0,
                                    ),
                                    height: 120,
                                    width: 400,
                                    child: Text(
                                      "Sorry! The signal was swallowed by the black hole. Please try again!",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF584797)),
                                      maxLines: null,
                                    ),
                                  ),
                                  // controller: controller,
                                  //  onChanged: (String value)async{if(value!=''){return _hascontent=true; }},
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 10.0,
                                        top: 0,
                                        right: 10,
                                        bottom: 0,
                                      ),
                                      alignment: Alignment.bottomRight,
                                      child: Icon(Icons.format_quote,
                                          color: Colors.grey)),
                                  Container(
                                    height: 20,
                                    width: 320,
                                  ),
                                  Container(
                                      height: 50,
                                      width: 320,
                                      child: Row(children: <Widget>[
                                        Container(
                                            width: 130,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              // boxShadow: <BoxShadow>[
                                              // BoxShadow(
                                              // color: Colors.grey.withOpacity(0.1),
                                              // blurRadius: 0.5,
                                              // offset: Offset(0.0, 1)),
                                              //],
                                            ),
                                            child: RaisedButton(
                                                //MaterialButton(
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  // side: BorderSide(color: Colors.white)
                                                ),
                                                //elevation: 5.0,
                                                //minWidth: 320,
                                                // height: 50,
                                                color: Colors
                                                    .white, //:Colors.grey,
                                                //padding: EdgeInsets.symmetric(vertical: 15.0),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Oh No",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xFF8F8E94),
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                        Container(
                                          width: 10,
                                          height: 80,
                                        ),
                                        Container(
                                            width: 130,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    blurRadius: 0.5,
                                                    offset: Offset(0.0, 1)),
                                              ],
                                            ),
                                            child: RaisedButton(
                                                //MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.deepPurple)),
                                                elevation: 5.0,
                                                //minWidth: 320,
                                                // height: 50,
                                                color: Color(
                                                    0xFF584797), //:Colors.grey,
                                                //padding: EdgeInsets.symmetric(vertical: 15.0),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  // showLoaderDialog(context);
                                                  //  Navigator.pop(context);
                                                  // Future.delayed(const Duration(seconds: 2), () {
                                                  // Navigator.of(context).pop();
                                                  // searchingPage(context).then((value) => null);
                                                  // });

                                                  //searchingPage(context).then((value) => null);
                                                },
                                                child: Text(
                                                  "Try Again",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                      ]))
                                ]))
                      ])));
        });
  }

  int presstime = 1;

  //main screen, top bar, bottom bar, menu
  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: ExactAssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )),
            child: SafeArea(
              child: Stack(children: <Widget>[
                // set top name
                Container(
                    alignment: Alignment.topLeft,
                    //alignment: Alignment(-0.4,-0.8),
                    child: Container(
                        width: 310,
                        height: 120,
                        child: Row(
                            //这个ROll里面包含了时间，和另一个roll（头像，发件人，信息）
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, //让两个roll分开展示
                            children: [
                              Column(children: <Widget>[
                                SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  //这个roll里面包裹的是头像，发件人名字和信息
                                  children: <Widget>[
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          _profilescreen();
                                        },
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: AssetImage(
                                              "assets/images/meee.png"),
                                        )),
                                    SizedBox(
                                      width: 13.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      //新建一个Column来放文字信息，发件人名字和最近信息
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start, //左对齐
                                      children: [
                                        Text(
                                          "ClaraY.",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 27.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.0,
                                        ),
                                        Container(
                                          //给信息一个Container，指定一个宽度，让文字overflow
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            "Since 2021",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                            ]))),
              ]),
            )),
        // floatingActionButton: AnchoredOverLay(),

        floatingActionButton: Container(
            height: 70.0,
            width: 70.0,
            color: Colors.transparent,
            child: FittedBox(
                child: FloatingActionButton(
              onPressed: () {
                showLoaderDialog(context);
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.of(context).pop();

                  if (presstime % 2 == 1) {
                    errorPage1(context);
                    presstime += 1;
                  } else {
                    searchingPage(context);
                    presstime += 1;
                  }
                });
              },
              backgroundColor: Colors.white,
              tooltip: 'Increment',
              child: Icon(
                Icons.wifi_tethering,
                color: Colors.deepPurple,
                size: 30,
              ),
              elevation: 2.0,
            ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: FABBottomAppBar(
            centerItemText: 'Search',
            color: Colors.deepPurple,
            selectedColor: Colors.blue,
            notchedShape: CircularNotchedRectangle(),
            // onTabSelected: _selectedTab,
            items: [
              FABBottomAppBarItem(iconData: Icons.send, text: 'Send'),
              FABBottomAppBarItem(iconData: Icons.chat, text: 'Chats'),
            ],
          ),
        ));
  }

  /*      // menu bar
        drawer: Container(
            width: 220,
            child: Drawer(
                child: Container(
              //color: Colors.grey,
              color: HexColor("F3893B"), //F3893B
              child: ListView(
                children: <Widget>[
                  Container(
                      height: 190,
                      alignment: Alignment.bottomCenter,
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: HexColor("F3893B"),
                          ),
                          child: Container(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                Material(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          'assets/images/meee.png',
                                          width: 80,
                                          height: 80,
                                        )))
                              ])))),
                  CustomListTile(Icons.person, 'PROFILE', () {}),
                  CustomListTile(Icons.notifications, 'MEMBERSHIP', () {}),
                  CustomListTile(Icons.settings, 'SETTINGS', () {}),
                  CustomListTile(Icons.logout, 'LOG OUT', () {
                    _logout();
                  }),
                  Container(
                      height: 270,
                      alignment: Alignment.bottomCenter,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Material(
                                // borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                //child:Padding(padding: EdgeInsets.all(15.0),
                                child: Image.asset(
                              'assets/images/pentakill.png',
                              width: 80,
                              height: 76,
                            )),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("@PENTAKILL",
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white)))
                          ]))
                ],
              ),
            ))));
  }
*/
/*
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
*/
  /* void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => route == null);
  }
*/
/*  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }
*/
  void _chat() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => ChatList()),
        (route) => route == null);
  }

  void _chatscreen() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) => ChatScreen(user: chat.sender)),
        (route) => route == null);
  }

  void _profilescreen() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => Profile()),
        (route) => route == null);
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Searching...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

// custom items in menu bar
class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color:Colors.deepOrangeAccent,
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
        child: InkWell(

            //splashColor: Colors.orangeAccent,
            onTap: onTap,
            child: Container(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //Icon(icon),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("      |  " + text,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ],
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    )
                  ],
                ))));
  }
}

void searchingImage(BuildContext context) {
  //TextEditingController controller = TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: false, // can not be closed by clicking outside border
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: //AlertDialog(
                  // contentPadding: EdgeInsets.zero,
                  //backgroundColor: Colors.transparent,
                  Material(
                      type: MaterialType.transparency,
                      //content: Stack(
                      // children: <Widget>[
                      child: Center(
                          // color: Colors.transparent,
                          child: Container(
                              //padding: EdgeInsets.all(10.0),
                              //alignment: new Alignment(0,0),
                              width: 500,
                              height: 555,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Container(
                                      //width:10000,
                                      //height:10000,
                                      child: Image.network(
                                    "https://media.giphy.com/media/IpOPOWp1A5YLaHrMho/giphy.gif",
                                    //"https://media.giphy.com/media/QPT5JvW2WhPmOeTrSu/giphy.gif",
                                    // "https://media.giphy.com/media/n5WSnw7wUmtmSVluGj/giphy.gif",
                                    //fit: BoxFit.contain,
                                  )))))));
        });
      });
}

void sendingImage(BuildContext context) {
  //TextEditingController controller = TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: false, // can not be closed by clicking outside border
      builder: (context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop(true);
          sendingsuceedImage(context);
        });
        return StatefulBuilder(builder: (context, setState) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: //AlertDialog(
                  // contentPadding: EdgeInsets.zero,
                  //backgroundColor: Colors.transparent,
                  Material(
                      type: MaterialType.transparency,
                      //content: Stack(
                      // children: <Widget>[
                      child: Center(
                          // color: Colors.transparent,
                          child: Container(
                              //padding: EdgeInsets.all(10.0),
                              //alignment: new Alignment(0,0),
                              width: 500,
                              height: 555,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Container(
                                      //width:10000,
                                      //height:10000,
                                      child: Image.network(
                                    "https://media.giphy.com/media/jxKEfqhqk3Ib4slQJd/giphy.gif",
                                    //fit: BoxFit.contain,
                                  )))))));
        });
      });
}

void sendingsuceedImage(BuildContext context) {
  //TextEditingController controller = TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: false,
      // can not be closed by clicking outside border
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return StatefulBuilder(builder: (context, setState) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: //AlertDialog(
                  // contentPadding: EdgeInsets.zero,
                  //backgroundColor: Colors.transparent,
                  Material(
                      type: MaterialType.transparency,
                      //content: Stack(
                      // children: <Widget>[
                      child: Center(
                          // color: Colors.transparent,
                          child: Container(
                              //padding: EdgeInsets.all(10.0),
                              //alignment: new Alignment(0,0),
                              width: 500,
                              height: 555,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Container(
                                      //width:10000,
                                      //height:10000,
                                      child: Image.network(
                                    "https://media.giphy.com/media/USJKf8XAkDf7qaqgRB/giphy.gif",
                                    //fit: BoxFit.contain,
                                  )))))));
        });
      });
}

/*return AlertDialog(
        contentPadding: EdgeInsets.all(0.0),
        content: Container(
          width: double.infinity,
          height: double.infinity,
                  child: Image.network(
                  "https://media.giphy.com/media/n5WSnw7wUmtmSVluGj/giphy.gif",
                  fit: BoxFit.cover,
                )),
  );
  });
}*/
