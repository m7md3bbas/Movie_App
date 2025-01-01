import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/presentation/Auth/manager/cubit/auth_cubit.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation(
      {required this.currentIndex, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blueGrey[900]!,
            Colors.black,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            color: currentIndex == 0 ? Colors.amberAccent : Colors.white,
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: currentIndex == 1 ? Colors.amberAccent : Colors.white,
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: currentIndex == 2 ? Colors.amberAccent : Colors.white,
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.find<AuthCubit>().logout();
            },
          ),
        ],
      ),
    );
  }
}
