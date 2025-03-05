import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickmassage/services/auth/auth_sevice.dart';
import 'package:quickmassage/services/chat/chat_sevices.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.recieveemail, required this.recieverid});
  final String recieveemail;
  final String recieverid;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();

  final ChatSevices _chatSevices = ChatSevices();

  final AuthSevice _authSevice = AuthSevice();

  //for textfeildfocus
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    // add a lithener to the focus node
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        //scroll down
        Future.delayed(Duration(seconds: 1), () => scrolldown());
      }
    });
    //scrool the list
    Future.delayed(Duration(seconds: 1), () => scrolldown());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    messageController.dispose();
    super.dispose();
  }

  //scroll controllar
  final ScrollController _scrollController = new ScrollController();
  void scrolldown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  //alignment
  void sendmessage() async {
    //sent massaeg if text feild is not empty
    if (messageController.text.isNotEmpty) {
      await _chatSevices.sendmassage(widget.recieverid, messageController.text);
      messageController.clear();
    }
    //scroll down after sending
    scrolldown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recieveemail)),
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
      stream: _chatSevices.getmessages(widget.recieverid, senderId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          controller: _scrollController,
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
                focusNode: _focusNode,
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
