import 'package:signal_main/chat/message_model.dart';
import 'package:signal_main/chat/chat_screen.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // appbar下面的区域用一个expanded Container包起来
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: // ListView是用来放对话框的（头像，名字和最新对话内容）
            ListView.builder(
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message chat = chats[index];
                  return GestureDetector(
                    //利用这个GD来探测onTap
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          user: chat.sender,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 6,
                        bottom: 0,
                        right: 1.0,
                        left: 1.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
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
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    AssetImage(chat.sender.imageUrl),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                //新建一个Column来放文字信息，发件人名字和最近信息
                                crossAxisAlignment:
                                    CrossAxisAlignment.start, //左对齐
                                children: [
                                  Text(
                                    chat.sender.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.0,
                                  ),
                                  Container(
                                    //给信息一个Container，指定一个宽度，让文字overflow
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      chat.text,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                chat.time,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(" "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
