
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SginInWidget extends StatelessWidget {
  const SginInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? '),
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}