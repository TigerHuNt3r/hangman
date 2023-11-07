import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hangman/views/game_view.dart';
import 'package:flutter/cupertino.dart';

class HomeViewController extends GetxController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController prison = TextEditingController();

  void jatekInditasa() {
    if (firstname.text != "" && lastname.text != "" && prison != "") {
      Get.to(GameView(), transition: Transition.cupertino);
    } else if (firstname.text == "") {
      Get.showSnackbar(GetSnackBar(message: "Nem adtad meg a keresztneved!"));
    } else if (lastname.text == "") {
      Get.showSnackbar(GetSnackBar(message: "Nem adtad meg a vezetékneved!"));
    } else if (prison.text == "") {
      Get.showSnackbar(GetSnackBar(message: "Nem adtad meg a börtön lakhelyed! :)"));
    }
  }
}
