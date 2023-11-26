import 'package:media_booster/Modal/music.dart';

class MusicList{
  MusicList._(){}
  static List<Music> getMusic(){
    return <Music>[
      Music("Main Kaun Hoon",
        "https://tse4.mm.bing.net/th?id=OIP.QwATnBBtgl1FxFSa1esziwHaEK&pid=Api&P=0&h=180",
        "Secret Super Star Song These song is good title by Singer",
        'assets/audio/main_koun_hoon.mp3',
      ),
      Music("Swag Se Swagat",
          "https://tse2.mm.bing.net/th?id=OIP.a1pOpoJygiEheAH7Y9KzlgHaFc&pid=Api&P=0&h=180",
          "Tiger zinda Hai's Song These song is good title by Singer",
          'assets/audio/swag_se_swagat.mp3'),
      Music("Bol Do Na Zara",
          "https://tse2.mm.bing.net/th?id=OIP.fTujlPRD-X0HnijkeitHegHaEK&pid=Api&P=0&h=180",
          "Azhar's Song These song is good title by Singer",
          'assets/audio/bol_do_na_zara.mp3'),
      Music("Dhadak Song",
          "https://tse2.mm.bing.net/th?id=OIP.I7TFGrKyvp7fvqP-6QlbHgHaEK&pid=Api&P=0&h=180",
          "Dhadak's song These song is good title by Singer",
          'assets/audio/dhadak.mp3'),
      Music("Dilbar Song",
          "https://tse1.mm.bing.net/th?id=OIP.F9d0AZgXEXBL31WAf2aV8gHaEn&pid=Api&P=0&h=180",
          "Dilbar's song These song is good title by Singer",
          'assets/audio/dilbar.mp3')
    ];
  }
}