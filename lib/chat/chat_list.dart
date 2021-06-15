import 'package:signal_main/chat/recent_chats.dart';
import 'package:signal_main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Stack(
        //不知道有没有多余的步骤
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_img.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: 68,
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.only(
                          left: 12,
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
                  height: 70,
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    left: 13,
                    bottom: 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      // SizedBox(
                      //   width: 10, //这里不是responsive的，可能需要后期调整
                      // ),
                      Text(
                        'Chats',
                        style: GoogleFonts.quicksand(
                          fontSize: 39,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                ),
                // 在这里加ListView之类的的东西
                SizedBox(
                  height: 25,
                ),
                RecentChats(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goback() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new HomeScreen()),
        (route) => route == null);
  }
}
