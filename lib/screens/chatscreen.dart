import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chat_message_type.dart';
import 'chatmessagewidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

Future<String> generateResponse(String prompt) async {
  const apiKey = "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";
  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        "temperature": 1,
        "max_tokens": 4000,
        "top_p": 1,
        "frequency_penalty": 0.0,
        "presence_penalty": 0.0
      }));
  Map<String, dynamic> newresponse = jsonDecode(response.body);
  return newresponse['choices'][0]['text'];
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isloading;
  @override
  void initState() {
    super.initState();
    isloading = false;
  }

  void _scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat AI"),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(16, 163, 127, 1),
        ),
        backgroundColor: Color(0XFF343541),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      var message = _messages[index];
                      return ChatMessageWidget(
                          text: message.text,
                          chatMessageType: message.chatMessageType);
                    })),
            Visibility(
              visible: isloading,
                child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )),
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    style: TextStyle(color: Colors.white),
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Enter Your Query",
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        fillColor: Color(0XFF444654),
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  )),
                  Visibility(
                    visible: !isloading,
                    child: Container(
                      color: Color(0XFF444654),
                      child: IconButton(
                        onPressed: () async {
                          setState(() {
                            _messages.add(ChatMessage(
                                text: _textController.text,
                                chatMessageType: ChatMessageType.user),
                            );
                            isloading=true;
                          });
                          var input=_textController.text;
                          _textController.clear();
                          Future.delayed(Duration(milliseconds: 50)).then((_) => _scrollDown());
                          generateResponse(input).then((value){
                            setState(() {
                              isloading=false;
                              _messages.add(
                                ChatMessage(text: value, chatMessageType: ChatMessageType.bot)
                              );
                            });
                          });
                          _textController.clear();
                          Future.delayed(Duration(milliseconds: 50)).then((_) =>_scrollDown());
                        },
                        icon: Icon(Icons.send_rounded,color: Colors.white,),
                        color: Color.fromRGBO(142, 142, 160, 1),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
