import 'package:chatapp5/views/chatScreen_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowMessage5 extends StatelessWidget {
  const ShowMessage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('tayeb')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          primary: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            QueryDocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
            return ListTile(
              title: Column(
                crossAxisAlignment: loginUser!.email == documentSnapshot['user']
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: loginUser!.email == documentSnapshot['user']
                          ? Colors.purple
                          : Colors.blue,
                      border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                          style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      documentSnapshot['message'],
                      textScaleFactor: 1.2,
                      style: loginUser!.email == documentSnapshot['user']
                          ? TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)
                          : TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.blue,
                              color: Colors.white),
                    ),
                  ),
                  Text(
                    documentSnapshot['user'],
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
