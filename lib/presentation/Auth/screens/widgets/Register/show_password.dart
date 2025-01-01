
import 'package:flutter/material.dart';

class ShowPasswordCheckBox extends StatelessWidget {
  const ShowPasswordCheckBox({
    super.key,
    required this.isObscured,
  });

  final ValueNotifier<bool> isObscured;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: isObscured,
          builder: (context, isObscuredValue, child) {
            return Checkbox(
              value: !isObscuredValue,
              onChanged: (value) => isObscured.value = !isObscuredValue,
            );
          },
        ),
        const Text('Show Password'),
      ],
    );
  }
}