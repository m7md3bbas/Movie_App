
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPasswordWidget extends StatelessWidget {
  const ShowPasswordWidget({
    super.key,
    required this.isObscuredNotifier,
  });

  final ValueNotifier<bool> isObscuredNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isObscuredNotifier,
          builder: (context, isObscured, child) {
            return Checkbox(
              value: !isObscured,
              onChanged: (value) {
                isObscuredNotifier.value = !isObscured;
              },
            );
          },
        ),
        Text('Show Password'),
        Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed('/forgetPassword');
          },
          child: Text('Forgot Password?'),
        )
      ],
    );
  }
}