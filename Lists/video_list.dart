

import 'package:media_booster/Modal/video.dart';

class VideoList {
  VideoList._(){}

  static List<Video> getVideo() {
    return <Video>[
      Video("Behti Hawa Sa Tha Woh",
          "assets/image/img_5.png",
          "Behti Hawa Sa Tha Who Lyrics by Swanand Kirkire from 3 Idiots. ",
          'assets/videos/behti_hawa_sa_tha_woh.mp4'),

      Video("Heeriye Song",
          "assets/image/img_6.png",
          "Heeriye (feat. Arijit Singh) from Heeriye (feat. Arijit Singh).",
          'assets/videos/heeriye.mp4'),

      Video("Jumka Gira re",
          "assets/image/img_7.png",
          "Jhoomka Gira Re Lyrics in Hindi from movie Mera Saaya sung by Asha Bhosle. ",
          'assets/videos/jumka_gira.mp4'),

      Video("Keseriya Tera",
          "assets/image/img_8.png",
          "Kesariya Lyrics from Brahmastra is brand new Hindi song sung by Arijit Singh. ",
          'assets/videos/kesariya_tera.mp4'),

      Video("Kheriyat Puchu",
          "assets/image/img_9.png",
          "Khairiyat Lyrics from Chhichhore is brand new Hindi Song sung by by Arijit Singh",
          'assets/videos/kheriyat_puchu.mp4'),

      Video("Le ke prabhu ka naam",
          "assets/image/img_10.png",
          "Leke Prabhu Ka Naam Teaser | Tiger 3 | Salman Khan, Katrina Kaif | Pritam",
          'assets/videos/le_ke_prabhu_ka_naam.mp4'),

      Video("Main hoon kaun",
          "assets/image/img_12.png",
          "Secret Super Star Song These song is good title by Singer",
          'assets/videos/main_hu_kaun.mp4'),

      Video("Tera Yaar Hu main",
          "assets/image/img_11.png",
          "Tera Yaar Hoon Mai Lyrics - an emotional song from Sonu Ke Titu Ki Sweety. ",
          'assets/videos/tera_yaar_hu_me.mp4'),



    ];
  }
}