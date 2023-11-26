import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Modal/music.dart';
import 'package:media_booster/Screen/audio_player.dart';

class AudioScreen extends StatefulWidget {
  final Music music;

  AudioScreen({Key? key, required this.music}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isAnimated = false;
  bool isPlay = true;
  bool isPause = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    player.open(
      Audio(widget.music.audio),
      autoStart: false,
      showNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Music Player"),
        ),
        backgroundColor: Colors.blueGrey,
        body: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.music.image,
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    widget.music.name,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    widget.music.desc,
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                IconButton(
                    onPressed: () {
                      player.seekBy(Duration(seconds: -10));
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      IconAnimation();
                    });
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    //progress: controller,
                    progress: controller,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      player.seekBy(Duration(seconds: 10));
                    },
                    icon: Icon(Icons.arrow_forward_ios)),
              ])
            ])));
  }

  void IconAnimation() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        controller.forward();
        player.play();
      } else {
        controller.reverse();
        player.pause();
      }
    });
  }
}
