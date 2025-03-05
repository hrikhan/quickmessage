import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickmassage/services/auth/auth_sevice.dart';
import 'package:quickmassage/services/chat/chat_sevices.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.recieveemail, required this.recieverid});
  final String recieveemail;
  final String recieverid;
  final TextEditingController messageController = TextEditingController();
  final ChatSevices _chatSevices = ChatSevices();
  final AuthSevice _authSevice = AuthSevice();
  //alignment

  //send message function
  void sendmessage() async {
    //sent massaeg if text feild is not empty
    if (messageController.text.isNotEmpty) {
      await _chatSevices.sendmassage(recieverid, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recieveemail)),
      body:
      //display the massage
      Column(children: [Expanded(child: _buildchatlist()), builduseinput()]),
      //user input
    );
  }

  //build chat list
  Widget _buildchatlist() {
    String senderId = _authSevice.getcurrentuser()!.uid;
    //align right sender is the current user

    return StreamBuilder(
      stream: _chatSevices.getmessages(recieverid, senderId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => buildmassageitem(doc)).toList(),
        );
      },
    );
  }

  Widget buildmassageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool iscurrentuser = data['senderId'] == _authSevice.getcurrentuser()!.uid;
    var alaignment =
        iscurrentuser ? Alignment.centerRight : Alignment.centerLeft;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Align(
        alignment: alaignment,
        child: Container(
          constraints: BoxConstraints(maxWidth: 250),

          decoration: BoxDecoration(
            color: iscurrentuser ? Colors.purple : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['message'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: iscurrentuser ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builduseinput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15, right: 10),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'type message',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.send,
                size: 35,
                color: const Color.fromRGBO(156, 39, 176, 1),
              ),
              onPressed: sendmessage,
            ),
          ),
        ],
      ),
    );
  }
}
