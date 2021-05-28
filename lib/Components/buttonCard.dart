import 'package:flutter/material.dart';

class buttonCard extends StatelessWidget {
  buttonCard({this.icon, this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: Color(0xff25d366),
        child: Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      // subtitle: Text(
      //   "f",
      //   style: TextStyle(
      //     fontSize: 13

      //   ),
      // ),
    );
  }
}
