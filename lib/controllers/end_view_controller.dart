import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EndViewController extends GetxController {
  bool legyenKonfettiEso = false;
  ConfettiController confettiController = ConfettiController();

  void konfetti(bool inditasa) {
    if (inditasa) {
      legyenKonfettiEso = true;
      confettiController.play();
    } else {
      legyenKonfettiEso = false;
      confettiController.stop();
    }
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    confettiController.play();
  }
}

