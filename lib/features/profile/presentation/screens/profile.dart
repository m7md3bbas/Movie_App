import 'package:flutter/material.dart';
import 'package:movieapp/features/profile/presentation/screens/profile_body_view.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: ProfileBodyView(),
    );
  }
}
