import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeNavigation {
  static List<Widget> get homeNavi {
    return [
      IconButton(
        onPressed: () {
          Get.offAllNamed("/home");
        },
        icon: Icon(Icons.home),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {
          Get.toNamed("/search");
        },
        icon: Icon(Icons.search),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.person),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.logout),
        color: Colors.white,
      ),
    ];
  }
}
