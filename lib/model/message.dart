import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderName;
  final String reciverid;
  final String message;
  final Timestamp time;
  Message({
    required this.senderId,
    required this.senderName,
    required this.reciverid,
    required this.message,
    required this.time,
  });
  //CONVERT TO MAPP
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
     'senderName': senderName,
     'reciverId': reciverid,
     'message': message,
      'time': time,
    };
  }
}
