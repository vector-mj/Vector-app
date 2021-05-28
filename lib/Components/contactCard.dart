import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/Model/chatModel.dart';

class contactCard extends StatelessWidget {
  contactCard({@required this.contact});
  final chatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            contact.selected?Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                radius: 11,
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ):Container()
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
