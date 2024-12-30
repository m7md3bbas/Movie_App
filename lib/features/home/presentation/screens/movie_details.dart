import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/custom_button.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';
import 'package:movieapp/features/home/presentation/screens/widgets/Custom_movie_image.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.movies,
    required this.currentIndex,
  });
  final List<MovieEntity> movies;
  final int currentIndex;

  static ValueNotifier<bool> currenttap = ValueNotifier(false);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 10,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.65,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    movies[currentIndex].orginalImage),
                                fit: BoxFit.fill)),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Color(0xff121312).withOpacity(0.2),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: ValueListenableBuilder(
                          valueListenable: currenttap,
                          builder: (context, value, child) => IconButton(
                            icon: value
                                ? Icon(
                                    Icons.bookmark_add,
                                    color: Colors.amberAccent,
                                    size: MediaQuery.of(context).size.height *
                                        0.058,
                                  )
                                : Icon(
                                    Icons.bookmark_add,
                                    size: MediaQuery.of(context).size.height *
                                        0.055,
                                  ),
                            onPressed: () =>
                                currenttap.value = !currenttap.value,
                          ),
                        ),
                        top: 10,
                        right: 10,
                      ),
                      Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.325,
                          left: MediaQuery.of(context).size.width * 0.41,
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_circle_outlined,
                                  color: Colors.amberAccent,
                                  size:
                                      MediaQuery.of(context).size.height * 0.1,
                                )),
                          )),
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: MediaQuery.of(context).size.height * 0.05,
                          color: Colors.amberAccent,
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.325 / 2,
                        left: MediaQuery.of(context).size.width * 0.10,
                        right: MediaQuery.of(context).size.width * 0.10,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            movies[currentIndex].title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.325 / 4,
                        left: MediaQuery.of(context).size.width * 0.41,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            movies[currentIndex].year.toString(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              fontWeight: FontWeight.normal,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.9,
                    isIcon: false,
                    text: "Watch Now",
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: movies[currentIndex].runtime.toString(),
                        isIcon: true,
                        icon: Icons.hourglass_bottom,
                      ),
                      CustomButton(
                        text: movies[currentIndex].rating.toString(),
                        isIcon: true,
                        icon: Icons.star,
                      ),
                      CustomButton(
                        text: movies[currentIndex].lan.toString(),
                        isIcon: true,
                        icon: Icons.language,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("Similar Movies",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        )),
                  )
                ],
              ),
            ),
            SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomMovieImage(
                      ontap: () {
                        Get.to(() => MovieDetails(
                              currentIndex: index,
                              movies: movies,
                            ));
                      },
                      image: movies[index].orginalImage,
                      rating: movies[index].rating);
                })
          ],
        ),
      ),
    );
  }
}
