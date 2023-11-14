import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hangman/views/game_view.dart';
import 'package:flutter/cupertino.dart';

class HomeViewController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController prison = TextEditingController();

  void jatekInditasa() {
    if (firstname.text != "" && lastname.text != "" && prison.text != "") {
      Get.to(GameView(), transition: Transition.cupertino);
    } else if (firstname.text == "") {
      Get.dialog(CupertinoAlertDialog(
        title: Text("Hiba"),
        content: Text("Nem adtad meg a keresztneved!"),
        actions: [
          CupertinoDialogAction(child: Text("ok"),
          onPressed: () {
            Get.back();
          },)
        ],
      ));
    } else if (lastname.text == "") {
            Get.dialog(CupertinoAlertDialog(
        title: Text("Hiba"),
        content: Text("Nem adtad meg a vezetékneved!"),
        actions: [
          CupertinoDialogAction(child: Text("ok"),
          onPressed: () {
            Get.back();
          },)
        ],
      ));
    } else if (prison.text == "") {
            Get.dialog(CupertinoAlertDialog(
        title: Text("Hiba"),
        content: Text("Nem adtad meg a börtönöd nevét!"),
        actions: [
          CupertinoDialogAction(child: Text("ok"),
          onPressed: () {
            Get.back();
          },)
        ],
      ));
    }
  }
}
