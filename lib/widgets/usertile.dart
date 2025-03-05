import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {
  Usertile({super.key, this.ontab, required this.text});
  final String text;
  final void Function()? ontab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(child: Icon(Icons.person, size: 20)),
            const SizedBox(width: 20),
            Text(
              text.replaceAll("@gmail.com", ""),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
