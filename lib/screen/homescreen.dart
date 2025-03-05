import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickmassage/services/auth/auth_sevice.dart';
import 'package:quickmassage/screen/chat_page.dart';
import 'package:quickmassage/services/chat/chat_sevices.dart';
import 'package:quickmassage/widgets/my_drawer.dart';
import 'package:quickmassage/widgets/usertile.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final AuthSevice _authSevice = AuthSevice();
  final ChatSevices _chatSevices = ChatSevices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        shadowColor: Colors.black,

        elevation: 0.2,
        title: Text('Quickchat', style: TextStyle(color: Colors.purple)),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      drawer: MyDrawer(),
      body: builduserlist(),
    );
  }

  Widget builduserlist() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatSevices.getusersteam(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No users found"));
        }

        // Ensure snapshot.data is not empty
        if (snapshot.data!.isEmpty) {
          return Center(child: Text("No users available"));
        }

        return ListView(
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => _buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  //build user list item
  Widget _buildUserListItem(
    Map<String, dynamic> usersata,
    BuildContext context,
  ) {
    //display indivudual user
    if (usersata['email'] != _authSevice.getcurrentuser()!.email) {
      return Usertile(
        text: usersata["email"],
        ontab: () {
          Get.to(
            ChatPage(
              recieveemail: usersata['email'],
              recieverid: usersata['uid'],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
