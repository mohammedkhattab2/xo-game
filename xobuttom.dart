import 'package:flutter/material.dart';

class Xobuttom extends StatelessWidget {
  String symbol;
  Function onclick;
  int index;

  Xobuttom({required this.symbol, required this.onclick , required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {
            onclick(index);
          },
          child: Text(
            "$symbol",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
