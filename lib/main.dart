import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('audios/note$soundNumber.wav'));
  }

  Expanded buildButton({int? number, Color? color}) {
    var expanded = Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color!),
        ),
        onPressed: () {
          playSound(number!);
        },
        child: const Text(''),
      ),
    );

    return expanded;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildButton(number: 1, color: Colors.red),
                buildButton(number: 2, color: Colors.orange),
                buildButton(number: 3, color: Colors.yellow),
                buildButton(number: 4, color: Colors.green),
                buildButton(number: 5, color: Colors.teal),
                buildButton(number: 6, color: Colors.blue),
                buildButton(number: 7, color: Colors.purple)
              ]),
        ),
      ),
    );
  }
}
