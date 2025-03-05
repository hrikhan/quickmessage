import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quickmassage/services/auth/auth_sevice.dart';
import 'package:quickmassage/screen/login_screen.dart';
import 'package:quickmassage/screen/setting.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout() {
    AuthSevice().signout();
    Get.offAll(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                accountName: Text('User Name'),
                accountEmail: Text('User Email'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('H O M E'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('S E T T I N G'),
                onTap: () {
                  Get.to(Setting());
                },
              ),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.only(bottom: 20, left: 20),
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('L O G O U T'),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
