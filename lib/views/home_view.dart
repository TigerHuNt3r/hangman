import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/controllers/home_view_controller.dart';
import 'package:hangman/views/game_view.dart';

class HomeView extends StatelessWidget {
  HomeViewController controller = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text("Hangman")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Image.asset("images/ember.jpg", width: 200),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.firstname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add meg a nevedet!",
                    labelText: "Kereszténv",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.lastname,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add meg a nevedet!",
                      labelText: "Vezetéknév"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.prison,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add meg a börtöned!",
                    labelText: "Börtön",
                  ),
                ),
              ),
              CupertinoButton.filled(
                child: Text("Start game"),
                onPressed: () {
                  controller.jatekInditasa();
                },
              )
            ],
          ),
        );
      }
    );
  }
}
