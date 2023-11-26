import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:media_booster/Lists/carosal_list.dart';

import 'package:media_booster/Lists/music_list.dart';

import 'package:media_booster/Modal/music.dart';
import 'package:media_booster/Provider/audio_provider.dart';


import 'package:media_booster/Screen/to_play.dart';
import 'package:provider/provider.dart';

Music? music;

// ignore: must_be_immutable
class AudioPlayer extends StatelessWidget {
  AudioPlayer({Key? key}) : super(key: key);

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<Music> musicList = MusicList.getMusic();

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
        builder: ((context, value, child) => SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              height: 250,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayInterval: const Duration(seconds: 2),
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                 currentIndex = index;
                              }),
                          items: carosalImg,
                          carouselController: carouselController,
                        ),

                      Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: DotsIndicator(
                              dotsCount: carosalImg.length,
                              position: currentIndex,
                              onTap: (index) {
                                carouselController.animateToPage(index);
                              },
                              decorator: const DotsDecorator(
                                color: Colors.grey,
                                activeColor: Colors.white,
                                size: Size.square(10.0),
                                activeSize: Size(20, 10),
                                //activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius:))
                              )))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Tranding Song",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  createMusicList('Trending Song'),
                ]))));
  }

  Widget createMusicList(label) {
    return Container(
        height: 350,
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AudioScreen(music: MusicList.getMusic()[index]),
                      ));
                },
                child: createMusic(musicList[index]));
          },
          itemCount: musicList.length,
        ));
  }

  Widget createMusic(Music music) {
    return Padding(padding: EdgeInsets.all(10),
      child:Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(music.image),
                backgroundColor: Colors.transparent,
              ),
              Column(
                children: [
                  Text(
                    music.name,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ]));
  }
}
