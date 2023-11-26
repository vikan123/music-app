import 'package:flutter/material.dart';
import 'package:media_booster/Modal/video.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
   VideoScreen({Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Video Player"),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
         VideoProgressIndicator(_controller, allowScrubbing: true),
        Padding(padding:EdgeInsets.all(10),child:Text(widget.video.name,style: TextStyle(fontSize: 30,color: Colors.white),)),
         Padding(padding:EdgeInsets.all(10),child:Text(widget.video.desc,style: TextStyle(color: Colors.white,fontSize: 20),)),

         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
           IconButton(
           onPressed: () {
         _controller.seekTo(Duration(seconds: -10));
         },
       icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
    GestureDetector(
    onTap: (){
      setState(() {
        _controller.value.isPlaying
            ? _controller.pause()
            : _controller.play();
      });
    },child: Icon((_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),color: Colors.white,size: 30,),
  ),
    IconButton(
      onPressed: () {
        _controller.seekTo(Duration(seconds: 10));
      },
      icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
           ],
         )
      ]),

    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
