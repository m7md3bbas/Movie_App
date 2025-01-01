
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SginUpWidget extends StatelessWidget {
  const SginUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Get.toNamed("/register");
          },
          child: Text('Sign up'),
        )
      ],
    );
  }
}
