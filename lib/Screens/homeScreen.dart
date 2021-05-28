import 'package:flutter/material.dart';
import 'package:whats_app/Pages/cameraPage.dart';
import 'package:whats_app/Pages/chatPage.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vectorapp'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child:Text("New chat"),value: "New chat",),
                PopupMenuItem(child:Text("New group"),value: "New group",),
                PopupMenuItem(child:Text("Whatsapp Web"),value: "Whatsapp Web",),
                PopupMenuItem(child:Text("New broadcast"),value: "New broadcast",),
                PopupMenuItem(child:Text("Setting"),value: "Setting",),
              ];
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.camera_alt),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('CHATS'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('STATUS'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('CALLS'),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          cameraPage(),
          chatPage(),
          Text('STATUS'),
          Text('CALLS'),
        ],
      ),
    );
  }
}
