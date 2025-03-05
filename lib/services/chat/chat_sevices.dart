import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickmassage/model/message.dart';

class ChatSevices {
  //instnce of firestor
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user steam
  Stream<List<Map<String, dynamic>>> getusersteam() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go to the data of the user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send massage
  Future<void> sendmassage(String recievedId, message) async {
    //get user info
    final String _currentuseid = _auth.currentUser!.uid;
    final String _currentusername = _auth.currentUser!.email!;
    final Timestamp _timestamp = Timestamp.now();

    //add new massage to the database
    Message newMassage = Message(
      senderId: _currentuseid,
      senderName: _currentusername,
      reciverid: recievedId,
      message: message,
      time: _timestamp,
    );
    //conduct chatroom id to ensure uniqeness
    List<String> ids = [_currentuseid, recievedId];
    ids.sort();
    String chatroomid = ids.join('_');
    await _firestore
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .add(newMassage.toMap());
  }

  // get massage
  Stream<QuerySnapshot> getmessages(String userid, otheruserid) {
    //chatroomid
    List<String> ids = [userid, otheruserid];
    ids.sort();
    String chatroomid = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatroomid)
        .collection('messages')
        .orderBy('time', descending: false)
        .snapshots();
  }
}
