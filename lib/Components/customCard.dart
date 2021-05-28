import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/Model/chatModel.dart';
import 'package:whats_app/Screens/chatScreen.dart';

class customCard extends StatelessWidget {
  customCard({@required this.cm});
  final chatModel cm;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatScreen(cm: cm,),
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset(
                cm.isGroup ? "assets/groups.svg" : "assets/person.svg",
                width: 24,
                height: 24,
                color: Colors.white,
              ),
              radius: 30,
            ),
            title: Text(
              cm.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done),
                SizedBox(
                  width: 3,
                ),
                Text(
                  cm.desc,
                  textAlign: TextAlign.end,
                )
              ],
            ),
            trailing: Text(cm.time),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            thickness: 1.5,
          ),
        )
      ],
    );
  }
}
