import 'package:flutter/material.dart';
import 'package:xo_game/gamebordscreen/gamebordscreen.dart';

class IntroScreen extends StatelessWidget {
  static String routname = "intro";

  String player1 = "";
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("intro screen"),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration.collapsed(hintText: "player one"),
          onChanged: (Text) {
            player1 = Text;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: "player one"),
          onChanged: (Text) {
            player2 = Text;
          },
        ),
        Spacer(),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Gamebordscreen.routename,
                  arguments: gamebordargument(player1, player2));
            },
            child: Text("start")),
      ]),
    );
  }
}

class gamebordargument {
  String p1;
  String p2;
  gamebordargument(this.p1, this.p2);
}
