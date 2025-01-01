
import 'package:flutter/material.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';

class PasswordFieldsWidget extends StatelessWidget {
  const PasswordFieldsWidget({
    super.key,
    required this.isObscured,
    required this.passwordController,
    required this.confirmpasswordController,
  });

  final ValueNotifier<bool> isObscured;
  final TextEditingController passwordController;
  final TextEditingController confirmpasswordController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isObscured,
      builder: (context, isObscuredValue, child) {
        return Row(
          children: [
            Expanded(
              child: MyTextField(
                prefixicon: const Icon(Icons.lock),
                type: 'Password',
                obscure: isObscuredValue,
                controller: passwordController,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: MyTextField(
                prefixicon: const Icon(Icons.lock),
                type: 'Confirm Password',
                obscure: isObscuredValue,
                controller: confirmpasswordController,
              ),
            ),
          ],
        );
      },
    );
  }
}