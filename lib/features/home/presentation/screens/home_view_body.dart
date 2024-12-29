import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/Genres/genre_model_view.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/TopRated/Top_rated_ModelView.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/middle_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody(
      {super.key, required this.currentIndex, required this.onIndexChanged});
  final int currentIndex;
  final void Function(int) onIndexChanged;
  static final List<Widget> pages = [
    IconButton(
      onPressed: () {
        Get.offAllNamed("/home");
      },
      icon: Icon(
        Icons.home,
        color: Colors.amber,
      ),
    ),
    IconButton(
      onPressed: () {
        Get.toNamed("/search");
      },
      icon: Icon(Icons.search,color: Colors.amber),
    ),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.person,color: Colors.amber),
    ),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.logout,color: Colors.amber),
     
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Stack(
        
        children: [
          CustomScrollView(
            slivers: [
              TopRatedModelview(
                  currentIndex: currentIndex, onIndexChanged: onIndexChanged),
              middleWidget(),
              const GenreModelView(),
            ],
          ),
          Positioned(
              bottom: 5,
              left: 20,
              right: 20,
              child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(pages.length, (index) => pages[index])),
              ))
        ],
      ),
    );
  }
}
