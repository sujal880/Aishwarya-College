import 'dart:math';

import 'package:aishwarya_college/screens/chat_message_type.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  ChatMessageWidget({required this.chatMessageType,required this.text});
  @override
  Widget build(BuildContext context) {
    Color _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      color: chatMessageType==ChatMessageType.bot? Color(0XFF444654) : Color(0XFF343541),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatMessageType==ChatMessageType.bot?
              Container(
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Row(
                      children: [

                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                          child: Image.asset("assets/images/chatgpt.png",color: Colors.white),
                        ),
                        SizedBox(width: 7),
                        Text("Bot",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ):Container(
            margin: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0XFF444654),
                  child: Icon(Icons.person,color: Colors.white)
                ),
                SizedBox(width: 7),
                Text("User",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8)
                ),
                child: AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(text,speed: Duration(milliseconds: 100),textStyle: TextStyle(color: _randomColor)),

                ],
                  totalRepeatCount: 1,
                )
              )
            ],
          ))
        ],
      ),
    );
  }
}
