import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,

        elevation: 0.2,
        title: Text('Setting', style: TextStyle(color: Colors.purple)),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
    );
  }
}
