import 'package:aishwarya_college/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class C extends StatefulWidget {
  const C({Key? key}) : super(key: key);

  @override
  State<C> createState() => _CState();
}

class _CState extends State<C> {
  late VideoPlayerController _controller;
  late Future<void>_initialize;
  @override
  void initState() {
    _controller=VideoPlayerController.network("https://youtu.be/dSBRQUebo7g");
    _initialize=_controller.initialize();
    _controller.setVolume(1.0);
    _controller.setLooping(true);
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("C Programming"),
        centerTitle: true,
      ),
      body: FutureBuilder(builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          return AspectRatio(aspectRatio: _controller.value.aspectRatio,child: VideoPlayer(_controller),);
        }
        else{
          return UiHelper.ShowIndicator(context);
        }
      })
    );
  }
}
