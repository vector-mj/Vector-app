import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_app/Model/chatModel.dart';

class avatarCard extends StatelessWidget {
  avatarCard({this.contact});
  final chatModel contact;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
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
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        Text(contact.name,style: TextStyle(fontSize: 13),)
      ],
    );
  }
}
