import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whats_app/Components/myMessageCard.dart';
import 'package:whats_app/Components/replyMessageCard.dart';
import 'package:whats_app/Model/chatModel.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class chatScreen extends StatefulWidget {
  chatScreen({@required this.cm});
  final chatModel cm;
  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  bool show = false;
  FocusNode focusnode = FocusNode();
  TextEditingController _controller = TextEditingController();
  IO.Socket socket;
  @override
  void initState() {
    super.initState();
    connect();
    focusnode.addListener(() {
      if (focusnode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect(){
    socket = IO.io("http://192.168.1.6:5000",<String,dynamic>{
      "transports":["websocket"],
      "autoConnect":false,
    });
    socket.connect();
    socket.onConnect((data){
      print("connected !");
      socket.emit("/test","Hello i am flutter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 72,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    // SizedBox(width: 8),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_back),
                    CircleAvatar(
                      radius: 20,
                      child: SvgPicture.asset(
                        widget.cm.isGroup
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cm.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Last seen in " + widget.cm.time,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text("View contact"),
                        value: "View contact",
                      ),
                      PopupMenuItem(
                        child: Text("Media, link, and docs"),
                        value: "Media, link, and docs",
                      ),
                      PopupMenuItem(
                        child: Text("Search"),
                        value: "Search",
                      ),
                      PopupMenuItem(
                        child: Text("Mute notifications"),
                        value: "Mute notifications",
                      ),
                      PopupMenuItem(
                        child: Text("Wallpaper"),
                        value: "Wallpaper",
                      ),
                    ];
                  },
                )
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height-145,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                        myMessageCard(),
                        replyMessageCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin:
                                    EdgeInsets.only(left: 8, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusnode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 6,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Type a message",
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions_outlined),
                                      onPressed: () {
                                        focusnode.unfocus();
                                        focusnode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            icon: Icon(Icons.attach_file),
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomsheet());
                                            }),
                                        IconButton(
                                            icon: Icon(Icons.camera_alt),
                                            onPressed: () {})
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8, left: 5),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF128C7E),
                                  radius: 24,
                                  child: Icon(Icons.mic, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        show ? emojiPicker() : Container(),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomsheet() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconcration(Icons.insert_drive_file, Colors.blue, "Document"),
                  iconcration(Icons.camera_alt, Colors.pink, "Camera"),
                  iconcration(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconcration(Icons.headset, Colors.orange, "Audio"),
                  iconcration(Icons.location_pin, Colors.teal, "Location"),
                  iconcration(Icons.person, Colors.blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcration(IconData iccon, Color color, String text) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              iccon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(text)
        ],
      ),
    );
  }

  Widget emojiPicker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        _controller.text = _controller.text + emoji.emoji;
      },
    );
  }
}
