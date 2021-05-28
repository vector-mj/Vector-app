import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class replyMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 60, top: 5,bottom: 20),
                child: Text("Hey",),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text("20:49",style: TextStyle(fontSize: 13),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}