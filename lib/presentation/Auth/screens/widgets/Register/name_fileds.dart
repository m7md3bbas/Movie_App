
import 'package:flutter/material.dart';
import 'package:movieapp/core/widgets/mytextfield.dart';

class NameFieldsWidget extends StatelessWidget {
  const NameFieldsWidget({
    super.key,
    required this.fnameController,
    required this.lnameController,
  });

  final TextEditingController fnameController;
  final TextEditingController lnameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            prefixicon: const Icon(Icons.person),
            type: 'First Name',
            obscure: false,
            controller: fnameController,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MyTextField(
            prefixicon: const Icon(Icons.person),
            type: 'Last Name',
            obscure: false,
            controller: lnameController,
          ),
        ),
      ],
    );
  }
}