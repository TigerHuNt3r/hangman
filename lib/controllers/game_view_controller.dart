// játék logika
import 'dart:math';
import 'package:hangman/models/tipp.dart';
import 'package:get/get.dart';
import 'package:hangman/views/end_view.dart';

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
    "Full Scale EQ",
    "Full Scale SQ",
    "Thinink",
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
    "illogical Thinking",
    "Johan Liebert",
    "Light Yagami",
    "IQ",
    "Creative Thinking",
    "Fast Thinking",
    "Academic Thinking",
    "Genius",
    "Creativity",
    "Execution Control",
    "Success Rate",
    "Less Limitations",
    "Cruel",
    "Ruthless",
    "Brutality",
    "Pure Evil",
    "Psychological Trick",
    "Psychological Strength",
    "Methods",
    "Observation",
    "Cold Reading",
    "Detection",
    "Charisma",
    "Influence",
    "Walter Hartwell White",
    "Michael Scofield",
    "Dexter Morgan",
    "Dr. Hannibal Lecter",
    "Patrick Jane",
    "John Kramer",
    "William Afton",
    "Springtrap",
    "Sherlock Holmes",
    "Will Graham",
    "Joker",
    "Albert Wesker",
    "Gustavo Fring",
  ];
  String randomSzoveg = "";
  String csillagosSzoveg = "";

  void init() {
    int index = Random().nextInt(szovegek.length);
    randomSzoveg = szovegek[index];
    csillagosSzoveg = "";
    for (int i = 0; i < randomSzoveg.length; i++) {
      csillagosSzoveg += "*";
    }
    tippek = [];
    update();
  }

  List<Tipp> tippek = [];

  bool nyertEaFelhasznalo() {
    return csillagosSzoveg == randomSzoveg;
  }

  bool aMegadottBetuVoltEmar(String betu) {
    bool tartalmazza = false;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].karakter == betu) {
        tartalmazza = true;
        break;
      }
    }
    return tartalmazza;
  }

  bool vesztettEaFelhasznalo() {
    int szamalao = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamalao++;
      }
    }
    if (szamalao == 6)
      return true;
    else
      return false;
  }
  

  int hibakSzama() {
    int szamalao = 0;
    for (int i = 0; i < tippek.length; i++) {
      if (tippek[i].talaltE == false) {
        szamalao++;
      }
    }
    return szamalao;
  }

  void tippHozzaadsa(String betu) {
    if (randomSzoveg.toLowerCase().contains(betu.toLowerCase())) {
      List<String> csillagosSzovegTemp = csillagosSzoveg.split('');
      for (int i = 0; i < randomSzoveg.length; i++) {
        if (randomSzoveg[i].toLowerCase() == betu.toLowerCase()) {
          csillagosSzovegTemp[i] = randomSzoveg[i];
        }
      }
      csillagosSzoveg = csillagosSzovegTemp.join();

      tippek.add(Tipp(karakter: betu, talaltE: true));
      update();
      if(nyertEaFelhasznalo()){
        Get.to(EndView("GRATULÁLUNK! Elkaptad Robit.", hibakSzama()));
      }
    } else {
      tippek.add(Tipp(karakter: betu, talaltE: false));
      update();
      if(vesztettEaFelhasznalo()){
        Get.to(EndView("GRATULÁLUNK ELVTÁRS! Felakasztottál egy cigányt! Megoldás: ${randomSzoveg} ", hibakSzama()));
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
   init();
  }
}
