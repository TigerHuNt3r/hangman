import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/game_view_controller.dart';
import 'package:hangman/views/widgets/letter_border.dart';
import 'package:hangman/views/widgets/letter_button.dart';

class GameView extends StatelessWidget {
  GameViewController controller = Get.put(GameViewController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Hangman"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("images/${controller.hibakSzama()}.png"),
              Text(controller.csillagosSzoveg, style: TextStyle(fontSize: 25),),
              Column(
                children: [
                  LetterHolder(
                    letters: ["A", "B", "C", "D", "E"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["F", "G", "H", "I", "J"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["K", "L", "M", "N", "O"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["P", "Q", "R", "S", "T"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["U", "X", "Y", "Z", "V"],
                    controller: controller,
                  ),
                  LetterHolder(
                    letters: ["W", " ", "", "", "",],
                    controller: controller,
                  ),
                ],
              )
            ]),
          );
        });
  }
}


