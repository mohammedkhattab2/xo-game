import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/gamebordscreen/gamebordscreen.dart';
import 'package:xo_game/gamebordscreen/intro%20screen.dart';

void main() {
  runApp(MaterialApp(
    title: "XO game ",
    routes: {
      Gamebordscreen.routename : (_) => Gamebordscreen(),
      IntroScreen.routname:(_) => IntroScreen()
    },
    initialRoute: IntroScreen.routname,
  ));
}
