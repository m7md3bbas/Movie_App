import 'package:flutter/material.dart';
import 'package:movieapp/domain/Entities/movie_entity.dart';
import 'package:movieapp/presentation/MainPage/button_navigation_page.dart';
import 'package:movieapp/presentation/Home/screens/home.dart';
import 'package:movieapp/presentation/Profile/screens/profile.dart';
import 'package:movieapp/presentation/Search/screens/search.dart';

class MainPageView extends StatefulWidget {
  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              Home(),
              Search(),
              Profile(),
            ],
          ),
          Positioned(
              bottom: 5,
              left: 20,
              right: 20,
              child:
                  BottomNavigation(currentIndex: _currentIndex, onTap: _onTap))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
