//import 'package:chat_part/models/message_model.dart';
//import 'package:chat_part/models/user_model.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:signal_main/message_model.dart';
import 'package:signal_main/chat/user_model.dart';
//import 'package:signal_main/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'dart:math';

import 'chat_list.dart';
import 'message_model.dart';
// import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static String mytext = '';
  FocusNode _focusNode;
  bool _visible = false;
  final myController = new TextEditingController();
  void _backbtm() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => ChatList()),
        (route) => route == null);
  }

  _buildMessage(Message message, bool isMe) {
    if (message.text.isNotEmpty) {
      return Row(
        //加了一个row之后，container的大小就会自动等于文字的大小，但是长文字好像不会分行
        children: [
          FocusedMenuHolder(
            onPressed: () {},
            menuItems: <FocusedMenuItem>[
              FocusedMenuItem(
                title: Text('Recall'),
                onPressed: () {
                  setState(() {
                    mytext = '';
                  });
                },
                trailingIcon: Icon(MdiIcons.messageArrowLeft),
              ),
            ],
            child: Container(
              margin: isMe //是我放左边，不是我放右边
                  ? EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 90.0,
                      right: 10.0,
                    )
                  : EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      // right: 80.0,
                      left: 10.0,
                    ),
              padding: EdgeInsets.symmetric(
                //这是对话框里面文字的padding
                horizontal: 25.0,
                vertical: 15.0,
              ),
              width: MediaQuery.of(context).size.width * 0.75,
              //为了让那个黄色的overflow pixel不出现要设一个宽度
              decoration: BoxDecoration(
                //pengpeng姐指定颜色
                color: isMe ? Color(0xFFFFF2C1) : Color(0xFFEEEDF5),
                borderRadius: isMe
                    ? BorderRadius.all(
                        Radius.circular(20.0),
                      )
                    : BorderRadius.all(
                        Radius.circular(20.0),
                      ),
              ),
              child: Column(
                //目前没用只是加一个column的padding
                children: <Widget>[
                  Text(
                    //这里改成变量可以立即反应，
                    message.text, //这是原来的代码
                    // mytext, //变量
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: isMe ? Color(0xFFE77817) : Color(0xFF584797),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } // if ends here
  }

  @override
  Widget build(BuildContext context) {
    List<Message> messages = [
      Message(
        sender: earth,
        time: 'now',
        text:
            'If you love a flower that lives on a star, it is sweet to look at the sky at night.',
      ),
      // Message(
      //   sender: currentUser,
      //   time: 'now',
      //   text: 'Hey, what\'s up a a a a a a a',
      // ),
      // Message(
      //   sender: earth,
      //   time: 'now',
      //   text: 'What\'s up man, this is a demo conversation.',
      // ),
      // Message(
      //   sender: currentUser,
      //   time: 'now',
      //   text: 'aaaaaaaaaaaaaa yeah, bla bla bla bla',
      // ),
      // Message(
      //   sender: earth,
      //   time: 'now',
      //   text: 'aaaaaaaaa bla bla bla bla bla bla bla bla ',
      // ),
      Message(
        sender: currentUser,
        time: 'now',
        text: mytext,
      ),
    ];
    return Scaffold(
      // backgroundColor: Colors.yellow, //让圆边显现出来
      body: Stack(
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
                          Icons.close,
                          color: Colors.grey,
                          size: 45,
                        ),
                        // color: Colors.white,
                        onPressed: () {
                          _backbtm();
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
                      Text(
                        widget.user.name,
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
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // 改颜色
                      border: Border.all(color: Colors.white),
                      //这里要加radius这段代码，但是需要修改之前的
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: ClipRRect(
                      //ClipRRect是将他的child全部包裹起来，R = Rounded
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      child: ListView.builder(
                        //连接上数据库后Listview需要改
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          // if 文字为null
                          final Message message = messages[index];
                          //return Text(messages[index].text); // 用下面的方法代替这个return
                          final bool isMe = message.sender.id == currentUser.id;
                          return _buildMessage(message, isMe);
                        },
                      ),
                    ),
                  ),
                ),
                //Visibility 加在这里试一试

                //发送信息的bar加在这里！
                Container(
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 5.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            // textAlign: TextAlign.start,
                            focusNode: _focusNode,
                            controller: myController,
                            //unfocus
                            autofocus: false,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () {
                              // print("edit");
                              _focusNode.unfocus();
                            },

                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            //keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none, //去除border的边框
                              ),
                              filled: true,
                              fillColor: Color(0xFFEEEDF5),
                              hintText: "Type here...",
                              hintStyle: TextStyle(
                                color: Color(0xFF584797).withOpacity(0.4),
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: Transform.rotate(
                                angle: -pi / 5.5, //调整icon的角度， 调整后为30度左右
                                child: IconButton(
                                  icon: Icon(
                                    MdiIcons.sendCircle,
                                    // size: 50.0, //这个size家在这里不会报错，但是有问题！
                                    color: Color(0xFF584797).withOpacity(0.9),
                                  ),
                                  iconSize: 57.0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 5.0,
                                  ),
                                  onPressed: () {
                                    // _sendMessage();
                                    mytext = myController.text;
                                    //新加的：
                                    // setState(() {
                                    //   mytext = myController.text;
                                    // });
                                    FocusScope.of(context).unfocus();
                                    myController.clear();
                                    _visible = true;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//  Future<String> _buildMessageComposer(BuildContext context) {
  // TextEditingController controller = TextEditingController();

  //刚刚剪切的位置

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  //把MessageList复制到这里

  // _sendMessage() {
  //   // this.setState(() => {mytext = myController.text});
  //
  //   setState(() {
  //     mytext = myController.text;
  //   });
  // }
}
