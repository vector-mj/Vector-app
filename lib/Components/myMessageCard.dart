import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class myMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width-45,
        ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color(0xffdcf8c6),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,right: 60, top: 5,bottom: 20),
                child: Text("Hey asdfh asdf asdf gdfg\n sdv sfdv sdfv sdf vsdffdgsadgsdfg sdfgfgdf dfgfdgdfg sdfg",),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text("20:49",style: TextStyle(fontSize: 13),),
                    SizedBox(width: 4,),
                    Icon(Icons.done_all,size: 18,)
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