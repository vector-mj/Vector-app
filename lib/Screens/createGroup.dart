import 'package:flutter/material.dart';
import 'package:whats_app/Components/avatarCard.dart';
import 'package:whats_app/Components/contactCard.dart';
import 'package:whats_app/Model/chatModel.dart';

class createGroup extends StatefulWidget {
  @override
  _createGroupState createState() => _createGroupState();
}

class _createGroupState extends State<createGroup> {
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
  List<chatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New group"),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length+1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.length > 0 ? 90 : 10,
                );
              }
              return InkWell(
                  onTap: () {
                    if (contacts[index-1].selected == false) {
                      setState(() {
                        contacts[index-1].selected = true;
                        groups.add(contacts[index-1]);
                      });
                    } else {
                      setState(() {
                        contacts[index-1].selected = false;
                        groups.remove(contacts[index-1]);
                      });
                    }
                  },
                  child: contactCard(
                    contact: contacts[index-1],
                  ));
            },
          ),
          groups.length > 0
              ? Column(
                  children: [
                    SizedBox(height: 5,),
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].selected) {
                              return InkWell(
                                child: avatarCard(
                                  contact: contacts[index],
                                ),
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].selected = false;
                                  });
                                },
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
