import 'package:flutter/material.dart';
import 'package:xo_game/game%20bottom/xobuttom.dart';
import 'package:xo_game/gamebordscreen/intro%20screen.dart';

class Gamebordscreen extends StatefulWidget {
  static String routename = "game board";

  @override
  State<Gamebordscreen> createState() => _GamebordscreenState();
}

class _GamebordscreenState extends State<Gamebordscreen> {
  int player1Score = 0;
  int player2Score = 0;
  List<String> bordstate = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    gamebordargument arg =
        ModalRoute.of(context)!.settings.arguments as gamebordargument;
    return Scaffold(
      appBar: AppBar(
        title: const Text("xo game"),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${arg.p1} : $player1Score",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${arg.p2}: $player2Score",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        )),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobuttom(
                symbol: bordstate[0],
                onclick: onbuttomclick,
                index: 0,
              ),
              Xobuttom(
                symbol: bordstate[1],
                onclick: onbuttomclick,
                index: 1,
              ),
              Xobuttom(
                symbol: bordstate[2],
                onclick: onbuttomclick,
                index: 2,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobuttom(
                symbol: bordstate[3],
                onclick: onbuttomclick,
                index: 3,
              ),
              Xobuttom(
                symbol: bordstate[4],
                onclick: onbuttomclick,
                index: 4,
              ),
              Xobuttom(
                symbol: bordstate[5],
                onclick: onbuttomclick,
                index: 5,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Xobuttom(
                symbol: bordstate[6],
                onclick: onbuttomclick,
                index: 6,
              ),
              Xobuttom(
                symbol: bordstate[7],
                onclick: onbuttomclick,
                index: 7,
              ),
              Xobuttom(
                symbol: bordstate[8],
                onclick: onbuttomclick,
                index: 8,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  int counter = 0;
  void onbuttomclick(int index) {
    if (bordstate[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "X" : "O";
    setState(() {
      bordstate[index] = symbol;
    });
    if (chickwinner(symbol)) {
      if (symbol == "O") {
        player1Score++;
      } else {
        player2Score++;
      }
      bordstate = ["", "", "", "", "", "", "", "", ""];
      counter = 0;
      setState(() {});
      return;
    }

    if (counter == 8) {
      bordstate = ["", "", "", "", "", "", "", "", ""];

      counter = 0;
      setState(() {});
      return;
    }
    counter++;
  }

  bool chickwinner(String symbol) {
    if (bordstate[0] == symbol &&
        bordstate[4] == symbol &&
        bordstate[8] == symbol) {
      return true;
    }
    if (bordstate[2] == symbol &&
        bordstate[4] == symbol &&
        bordstate[6] == symbol) {
      return true;
    }
    for (int i = 0; i > 3; i++) {
      if (bordstate[i] == symbol &&
          bordstate[i + 3] == symbol &&
          bordstate[i + 6] == symbol) {
        return true;
      }
    }
    for (int i = 0; i > 7; i += 3) {
      if (bordstate[i] == symbol &&
          bordstate[i + 1] == symbol &&
          bordstate[i + 2] == symbol) {
        return true;
      }
    }
    return false;
  }
}
