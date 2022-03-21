import 'package:chatapp5/views/showMessage_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatScreenPage5 extends StatefulWidget {
  const ChatScreenPage5({Key? key}) : super(key: key);

  @override
  State<ChatScreenPage5> createState() => _ChatScreenPage5State();
}

class _ChatScreenPage5State extends State<ChatScreenPage5> {

  var message = TextEditingController();
  var storeMessage = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void getCurrentUser(){
    var user = firebaseAuth.currentUser;
    if(user !=null){
      loginUser = user;
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            SizedBox(height: 400,),
            ShowMessage5(),
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
                      if(message != null){
                        storeMessage.collection('tayeb').doc().set({
                          'message': message.text.trim(),
                          'user' : loginUser!.email.toString().trim(),
                          'time' : DateTime.now()
                        });
                      }
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
      ),
    );
  }
}
