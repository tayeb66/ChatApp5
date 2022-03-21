import 'package:flutter/material.dart';

class ChatScreenPage5 extends StatefulWidget {
  const ChatScreenPage5({Key? key}) : super(key: key);

  @override
  State<ChatScreenPage5> createState() => _ChatScreenPage5State();
}

class _ChatScreenPage5State extends State<ChatScreenPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatScreenPage5'),
        centerTitle: true,
      ),
    );
  }
}
