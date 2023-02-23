import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_message_type.dart';
class ChatMessageWidget extends StatelessWidget {
  final String text;
  final ChatMessageType chatMessageType;
  ChatMessageWidget({required this.chatMessageType,required this.text});
  @override
  Widget build(BuildContext context) {
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
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(16, 163, 127, 1),
                  child: Image.asset("assets/images/chatgpt.png",color: Colors.white),
                ),
              ):Container(
            margin: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0XFF444654),
              child: Icon(CupertinoIcons.person_alt),
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
                child: Text(text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
              )
            ],
          ))
        ],
      ),
    );
  }
}
