import 'package:flutter/material.dart';
import 'package:whats_app/Components/customCard.dart';
import 'package:whats_app/Model/chatModel.dart';
import 'package:whats_app/Screens/selectContactScreen.dart';

class chatPage extends StatefulWidget {
  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  List<chatModel> chats = [
    chatModel(
        desc: "Hi mohammad 😀",
        icon: "preson.svg",
        isGroup: false,
        name: "Ali",
        time: "17:32"),
    chatModel(
        desc: "Hi Ali 😀",
        icon: "preson.svg",
        isGroup: false,
        name: "parsa",
        time: "21:32"),
    chatModel(
        desc: "Hi Ali 😀",
        icon: "group.svg",
        isGroup: true,
        name: "amir",
        time: "21:32"),
    chatModel(
        desc: "whats up guys 😎",
        icon: "preson.svg",
        isGroup: false,
        name: "mr behruzzzzzzzzzzzzzz",
        time: "11:32"),
    chatModel(
        desc: "how are you ?",
        icon: "preson.svg",
        isGroup: false,
        name: "nim",
        time: "6:32"),
    chatModel(
        desc: "Hi mohammad 😀",
        icon: "preson.svg",
        isGroup: true,
        name: "Ali",
        time: "17:32"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => selectContactScreen(),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => customCard(
          cm: chats[index],
        ),
      ),
    );
  }
}
