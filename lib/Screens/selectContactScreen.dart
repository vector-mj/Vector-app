import 'package:flutter/material.dart';
import 'package:whats_app/Components/buttonCard.dart';
import 'package:whats_app/Components/contactCard.dart';
import 'package:whats_app/Model/chatModel.dart';
import 'package:whats_app/Screens/createGroup.dart';

class selectContactScreen extends StatefulWidget {
  @override
  _selectContactScreenState createState() => _selectContactScreenState();
}

class _selectContactScreenState extends State<selectContactScreen> {
  List<chatModel> contacts = [
    chatModel(name: "mohammad", status: "is offline"),
    chatModel(name: "javad", status: "is online"),
    chatModel(name: "erfan", status: "lest seen long time ago"),
    chatModel(name: "ali", status: "lest seen recently"),
    chatModel(name: "mohammad", status: "is offline"),
    chatModel(name: "javad", status: "is online"),
    chatModel(name: "erfan", status: "lest seen long time ago"),
    chatModel(name: "ali", status: "lest seen recently"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact"),
            Text(
              "124 contact",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>createGroup(),),);
                },
                child: buttonCard(
                  icon: Icons.group,
                  title: "New group",
                ));
          } else if (index == 1) {
            return buttonCard(
              icon: Icons.person_add,
              title: "New contact",
            );
          }
          return contactCard(
            contact: contacts[index - 2],
          );
        },
      ),
    );
  }
}
