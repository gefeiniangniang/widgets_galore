//import 'package:flutter/cupertino.dart';
import 'package:signal_main/chat/user.dart';

class Message{
  final User sender;
  final String time;
  final String text;
  //bool isLiked;
  //bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    //this.isLiked,
    //this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id:0,
  name:'Current User',
  imageUrl:'assets/images/meee.png',
);

//User
final User greg = User(
  id:1,
  name:'Greg',
  imageUrl:'assets/images/greggg.png',
);

//chats
List<Message> chats = [
  Message(
    sender: greg,
    time:'5:30PM',
    text:'Hey',
    //isLiked: false,
    //unread: true,
  ),
];
