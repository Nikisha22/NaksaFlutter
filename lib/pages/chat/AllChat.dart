// MessagePage.dart
import 'package:NAKSA/pages/chat/Personalmsg.dart';


import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView(
        children: [
          MessageItem(
            sender: 'John',
            message: '',
            time: '10:00 AM',
          ),
          Divider(),
          MessageItem(
            sender: 'Jane',
            message: '',
            time: '10:05 AM',
          ),
          Divider(),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;

  const MessageItem({
    Key? key,
    required this.sender,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(sender[0]),
      ),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallMessageDestinationPage(sender: sender),
          ),
        );
     },
);
}
}