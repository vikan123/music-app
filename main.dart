import 'package:flutter/material.dart';
import 'package:media_booster/Provider/audio_provider.dart';
import 'package:provider/provider.dart';

import 'Screen/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (context)=>AudioProvider())
        ],
        child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));
  }
}
