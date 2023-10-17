// játék logika
import 'dart:math';
import 'package:hangman/models/tipp.dart';
import 'package:get/get.dart';

class GameViewController extends GetxController {
  List<String> szovegek = [
    "Psycho",
    "Intellect",
    "Autism",
    "Schizophrenia",
    "Mental Stability",
    "Intelligence",
    "Full Scale IQ",
    "Battle IQ",
    "Emotional Intelligence",
    "Strategy",
    "Intelligent Psycho",
    "Knowledge",
    "Planning",
    "Manipulation",
    "Deception",
    "Mental Strength",
    "Mental Ability",
    "Smart",
    "Empathy",
    "Logical Thinking",
    "Creative Thinking",
    "Fast Thinking",

  ];
  String randomSzoveg = "";
  String csillagosSzoveg = "";
  
  void randomSzovegGeneralasa() {
    int index = Random().nextInt(szovegek.length);
    randomSzoveg = szovegek[index];
    csillagosSzoveg="";
    for(int i=0;i < randomSzoveg.length;i++){
      csillagosSzoveg += "*";
    }
    update();
  }

  List<Tipp> tippek = [];
  
  bool nyertEaFelhasznalo(){
    return csillagosSzoveg==randomSzoveg;
  }

  @override
  void onInit() {
    super.onInit();
    randomSzovegGeneralasa();
  }
}
