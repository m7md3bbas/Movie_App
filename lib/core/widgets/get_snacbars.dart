import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetSnacbars {
  static void ErrorSnackbar(String message) {
    Get.snackbar(
      icon: Icon(Icons.error),
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: const Color.fromARGB(255, 152, 34, 26),
      colorText: Colors.white,
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }

  static void SuccessSnackbar(String message) {
    Get.snackbar(
      icon: Icon(Icons.check),
      'Success',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
