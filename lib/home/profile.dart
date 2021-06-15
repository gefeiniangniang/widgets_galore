import 'package:signal_main/home/fabbottomappbar.dart';
import 'package:signal_main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

String _test = "Hello how are you?";

class _ProfileState extends State<Profile> {
  ProgressDialog dialog;

  @override
  Widget build(BuildContext context) {
    List<SignalSent> signals = [
      SignalSent(time: 'now', text: _test),
      SignalSent(
        time: '8:30 AM',
        text: '',
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.grey[700],
      // body: SafeArea(
      body: Stack(
        //不知道有没有多余的步骤
        children: [
          //]<Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profilebackground.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 35,
                ),
                Container(
                  height: 68,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      //]<Widget>[
                      IconButton(
                        padding: EdgeInsets.only(
                          left: 15,
                          top: 10,
                        ),
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.grey,
                          size: 45,
                        ),
                        // color: Colors.white,
                        onPressed: () {
                          _goback();
                        },
                      )
                    ],
                  ),
                ),

                Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    color: Colors.transparent,
                    //alignment: Alignment(-0.4,-0.8),
                    child: Container(
                        //width: 400,
                        width: double.infinity,
                        height: 85,
                        color: Colors.transparent,
                        child: Row(
                            //这个ROll里面包含了时间，和另一个roll（头像，发件人，信息）
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, //让两个roll分开展示
                            children: [
                              Column(children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //这个roll里面包裹的是头像，发件人名字和信息
                                  children: <Widget>[
                                    SizedBox(
                                      width: 25.0,
                                    ),

                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage("assets/images/meee.png"),
                                    ),
                                    SizedBox(
                                      width: 15.0,
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
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                            width: 60,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              /* boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.grey.withOpacity(0.1),
                                                        //  color: Colors.transparent,
                                                          blurRadius: 0.5,
                                                          offset: Offset(0.0, 1)),
                                                    ],*/
                                            ),
                                            child: FlatButton(
                                                //RaisedButton(//MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.grey[400])),
                                                //elevation: 5.0,
                                                //minWidth: 320,
                                                // height: 50,
                                                color: Colors
                                                    .transparent, //:Colors.grey,
                                                //padding: EdgeInsets.symmetric(vertical: 15.0),
                                                onPressed: () {},
                                                child: Text(
                                                  "Edit",
                                                  style: GoogleFonts.quicksand(
                                                    // fontWeight: FontWeight.w900,
                                                    color: Colors.grey[400],
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ))),
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  200,
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                padding: EdgeInsets.only(
                                                  right: 27,
                                                  //top: 10,
                                                ),
                                                icon: Icon(
                                                  Icons.settings,
                                                  color: Colors.grey,
                                                  size: 38,
                                                ),
                                                // color: Colors.white,
                                                onPressed: () {},
                                              )),
                                        ]), //width: double.maxFinite,
                                    //  alignment: Alignment.centerRight,
                                    //   child: Icon(Icons.settings,color: Colors.white,size:20,),
                                  ],
                                ),
                              ]),
                            ]))),
                Container(
                  height: 10,
                ),
                Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 25,
                      //top: 10,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(
                                left: 30,
                                //top: 10,
                              ),
                              child: Text(
                                "Sent",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.left,
                              )),
                          Container(
                            height: 3,
                          ),
                          Container(
                            width: 100,
                            height: 4,
                            color: Colors.yellow,
                          ),
                          Container(
                            height: 10,
                          ),
                        ])),
                // Container(
                //   child: RecentSignalSent(),
                // ),

                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      //height: double.maxFinite,//500,
                      child: ListView.builder(
                          itemCount: signals.length,
                          itemBuilder: (BuildContext context, int index) {
                            final SignalSent chat = signals[index];
                            if (signals[index].text.isNotEmpty) {
                              return Container(
                                margin: EdgeInsets.only(
                                  top: 0,
                                  bottom: 0,
                                  right: 1.0,
                                  left: 1.0,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //color: chat.unread ? Color(0xFFFEF9EB) : Colors.white60,
                                    //设置聊天框的边框弧度和底色
                                    border: new Border.all(
                                      width: 0.2,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )),
                                //这个Container里面用来设置边框等信息

                                child: Row(
                                  //这个ROll里面包含了时间，和另一个roll（头像，发件人，信息）
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween, //让两个roll分开展示
                                  children: [
                                    Row(
                                      //这个roll里面包裹的是头像，发件人名字和信息
                                      children: <Widget>[
                                        SizedBox(
                                          width: 0.0,
                                        ),
                                        Column(
                                          //新建一个Column来放文字信息，发件人名字和最近信息
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start, //左对齐
                                          children: [
                                            SizedBox(
                                              height: 0.0,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Color(0xFF584797)
                                                    .withOpacity(0.2),
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: Text(
                                                    chat.text,
                                                    style: TextStyle(
                                                      color: Color(0xFF45377D),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    // overflow: TextOverflow.ellipsis,
                                                  )),
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 7),
                                                child: Text(
                                                  chat.time,
                                                  //"now",
                                                  style: TextStyle(
                                                    fontSize: 13.0,
                                                    color: Colors.grey,
                                                    // fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                          bottom: 20,
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            FlatButton(
                                                //RaisedButton(//MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    side: BorderSide(
                                                        color: Colors
                                                            .deepPurple[900])),
                                                //elevation: 5.0,
                                                minWidth: 60,
                                                height: 25,
                                                color: Colors.transparent,
                                                onPressed: () {
                                                  showLoaderDialog(context);
                                                  Future.delayed(
                                                      Duration(seconds: 1), () {
                                                    // Navigator.pushReplacement(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //         builder: (BuildContext context) => this.widget));
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      _test = '';
                                                    });
                                                  });
                                                },
                                                child: Text(
                                                  "Recall",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF45377D),
                                                    fontSize: 13,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ],
                                        )),
                                  ],
                                ),
                              );
                            } else {
                              if (index == 0) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 100,
                                    bottom: 0,
                                    right: 30.0,
                                    left: 30.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        "You haven't sent any signals yet",
                                        style: TextStyle(
                                          color: Colors.deepPurple[900],
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                      ),
                                      Text(
                                        "You can start to build connections with others by sending signals.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                      ),
                                      FlatButton(
                                          //RaisedButton(//MaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              side: BorderSide(
                                                  color:
                                                      Colors.deepPurple[900])),
                                          //elevation: 5.0,
                                          minWidth: 250,
                                          height: 50,
                                          color: Colors
                                              .deepPurple[900], //:Colors.grey,
                                          //padding: EdgeInsets.symmetric(vertical: 15.0),
                                          onPressed: () {
                                            _goback();
                                          },
                                          child: Text(
                                            "Send signals now",
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                            textAlign: TextAlign.center,
                                          ))
                                    ],
                                  ),
                                );
                              } else {
                                return null;
                              }
                            }
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        //),
      ),
    );
  }

  void _goback() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new HomeScreen()),
        (route) => route == null);
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Recalling...")),
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

class SignalSent {
  //final User sender;
  String time;
  String text;

  SignalSent({
    // this.sender,
    this.time,
    this.text,
  });
}

/*

class RecentSignalSent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child:Container(
    margin: EdgeInsets.only(top: 20,),
        child: ListView.builder(
            itemCount: signals.length,
            itemBuilder: (BuildContext context, int index) {
              final SignalSent chat = signals[index];
              if(chat.text.isNotEmpty) {
                return Container(
                  margin: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: 1.0,
                    left: 1.0,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //color: chat.unread ? Color(0xFFFEF9EB) : Colors.white60,
                      //设置聊天框的边框弧度和底色
                      border: new Border.all(
                        width: 0.2,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  //这个Container里面用来设置边框等信息

                  child: Row(
                    //这个ROll里面包含了时间，和另一个roll（头像，发件人，信息）
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //让两个roll分开展示
                    children: [
                      Row(
                        //这个roll里面包裹的是头像，发件人名字和信息
                        children: <Widget>[

                          SizedBox(
                            width: 0.0,
                          ),
                          Column(
                            //新建一个Column来放文字信息，发件人名字和最近信息
                            crossAxisAlignment:
                            CrossAxisAlignment.start, //左对齐
                            children: [

                              SizedBox(
                                height: 0.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.deepPurple[100],
                                ),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.65,
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      chat.text,
                                      style: TextStyle(
                                        color: Colors.deepPurple[900],
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 20, top: 7),
                                  child: Text(
                                    chat.time,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.grey,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: FlatButton( //RaisedButton(//MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                      color: Colors.deepPurple[900])),
                              //elevation: 5.0,
                              minWidth: 60,
                              height: 25,
                              color: Colors.transparent,
                              //:Colors.grey,
                              //padding: EdgeInsets.symmetric(vertical: 15.0),
                              onPressed: () {
                                async()
                               //this.setState(() {_signalsent = '';});
                                /*Navigator.pushReplacement(
                                         context,
                                         MaterialPageRoute(
                                              builder: (BuildContext context) => this));;*/
                              },
                              child: Text(
                                "Recall",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple[900],
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.center,
                              ))
                      ),
                    ],
                  ),
                );
              }else{
                return null;}}),
      ),
    ));
  }

static String _signalsent = "Hello how are you?";

  List<SignalSent> signals = [
    SignalSent(time:'now', text:_signalsent),
    //SignalSent('8:30 AM', ''),

  ];

}
*/
