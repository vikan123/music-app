import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Lists/carosal_list.dart';
import 'package:media_booster/Lists/video_list.dart';
import 'package:media_booster/Modal/video.dart';
import 'package:media_booster/Provider/audio_provider.dart';
import 'package:media_booster/Screen/to_video.dart';
import 'package:provider/provider.dart';
Video? video;
class VideoPlayer extends StatelessWidget {
  VideoPlayer({Key? key}) : super(key: key);
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<Video> videoList = VideoList.getVideo();


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
                  const SizedBox(height: 20,),
             const Padding(padding:EdgeInsets.all(10),child: Text("Video Player",style: TextStyle(fontSize: 30,color: Colors.white),)),
                  createVideoGrid()


                ]))));
  }
}

Widget createVideoGrid(){
  List<Video> videoList = VideoList.getVideo();
  return GridView.builder(shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0
    ),
        itemCount: videoList.length,
        itemBuilder: (BuildContext context, int index){
        return InkWell(onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    VideoScreen(video: VideoList.getVideo()[index]),
              ));
        },
        child: createVideo( videoList[index]),);
        }
  ) ;
  }



Widget createVideo(Video video){

  return  Padding(padding: EdgeInsets.all(10),
    child:SingleChildScrollView(child:Column(
      children: [
        Image.asset(video.image,fit: BoxFit.cover,),
        Text(video.name,style: TextStyle(fontSize: 25,color: Colors.white),),
        Text(video.desc,style: TextStyle(color: Colors.white),),

      ],
    ),

    )) ;
}
