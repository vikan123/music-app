import 'package:flutter/material.dart';
import 'package:media_booster/Screen/audio_player.dart';
import 'package:media_booster/Screen/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueGrey.shade300, Colors.grey, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  createAppBar(),
                  createTabBar(),
                ],
              ),
            )));
  }
}

Widget createAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Text("Audio Player"),
    actions: const [
      Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.settings,
            color: Colors.white,
          )),
    ],
    );
  }
Widget createTabBar() {
  return DefaultTabController(
    length: 2,
    child: Column(children: [
      Container(
        //height: 50,
        child: const TabBar(
          tabs: [
            Tab(text: 'Audio'),
            Tab(text: 'Video'),
          ],
        ),
      ),
      SizedBox(
          height: 800,
          width: 400,
          child: TabBarView(children: [
            AudioPlayer(),
            VideoPlayer(),

          ])),

    ]),
  );
}








