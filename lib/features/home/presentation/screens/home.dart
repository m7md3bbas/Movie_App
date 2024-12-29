import 'package:flutter/material.dart';
import 'package:movieapp/features/home/presentation/screens/home_view_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: HomeViewBody(
        currentIndex: currentIndex,
        onIndexChanged: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
