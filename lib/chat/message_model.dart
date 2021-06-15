import 'package:signal_main/chat/user_model.dart';

class Message {
  final User sender;
  final String
      time; // can change to type DateTime to get a better function, ala I have time
  final String text;

  Message({
    this.sender,
    this.time,
    this.text,
  });
}

// Me - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/me.png',
);

// the users displayed in ChatList page
final User earth = User(
  id: 1,
  name: 'Earth',
  imageUrl: 'assets/images/earth.png',
);
final User bb8 = User(
  id: 2,
  name: 'BB-8',
  imageUrl: 'assets/images/bb8.png',
);
final User morty = User(
  id: 3,
  name: 'Morty',
  imageUrl: 'assets/images/morty.png',
);
final User rick = User(
  id: 4,
  name: 'Rick',
  imageUrl: 'assets/images/rick.png',
);
final User penta = User(
  id: 5,
  name: '@pentakill',
  imageUrl: 'assets/images/penta.png',
);

// Chat List 的展示信息
List<Message> chats = [
  Message(
    sender: earth,
    time: 'now',
    text:
        'If you love a flower that lives on a star, it is sweet to look at the sky at night.',
  ),
  Message(
    sender: bb8,
    time: '8:30 AM',
    text: 'beep beep',
  ),
  Message(
    sender: morty,
    time: '7:56 AM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
  Message(
    sender: rick,
    time: '2:30 AM',
    text: 'WUBBA LUBBA DAB DAB!!',
  ),
  Message(
    sender: penta,
    time: '1:30 AM',
    text: 'Hey, Welcome!',
  ),
];

//点进对话框展示的信息
// List<Message> messages = [
//   Message(
//     sender: earth,
//     time: 'now',
//     text: 'Hello Hello aaaaaaaaaaaaaaaaaa',
//   ),
//   Message(
//     sender: currentUser,
//     time: 'now',
//     text: 'Hey, what\'s up a a a a a a a',
//   ),
//   Message(
//     sender: earth,
//     time: 'now',
//     text: 'What\'s up man, this is a demo conversation.',
//   ),
//   Message(
//     sender: currentUser,
//     time: 'now',
//     text: 'aaaaaaaaaaaaaa yeah, bla bla bla bla',
//   ),
//   Message(
//     sender: earth,
//     time: 'now',
//     text: 'aaaaaaaaa bla bla bla bla bla bla bla bla ',
//   ),
//   Message(
//     sender: currentUser,
//     time: 'now',
//     text: 'a a a a a a a a no one will like you',
//   ),
// ];
