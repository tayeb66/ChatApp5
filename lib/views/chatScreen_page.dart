import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreenPage5 extends StatefulWidget {
  const ChatScreenPage5({Key? key}) : super(key: key);

  @override
  State<ChatScreenPage5> createState() => _ChatScreenPage5State();
}

class _ChatScreenPage5State extends State<ChatScreenPage5> {

  var message = TextEditingController();
  var storeMessage = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatScreenPage5'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                Navigator.pop(context);
                preferences.clear();
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Message',
              textScaleFactor: 1.3,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextFormField(
                      controller: message,
                      decoration: InputDecoration(
                        hintText: 'Write message',
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    message.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
