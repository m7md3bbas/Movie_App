import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/custom_button.dart';
import 'package:movieapp/features/home/data/models/movie_model.dart';
import 'package:movieapp/features/home/domain/entities/movie_entity.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({
    super.key,
    required this.movies,
    required this.currentIndex,
  });
  final List<MovieEntity> movies;
  final int currentIndex;
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool currenttap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                              widget.movies[widget.currentIndex].orginalImage),
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
                  child: IconButton(
                    icon: currenttap == true
                        ? Icon(
                            Icons.bookmark_add,
                            color: Colors.amberAccent,
                            size: MediaQuery.of(context).size.height * 0.058,
                          )
                        : Icon(
                            Icons.bookmark_add,
                            size: MediaQuery.of(context).size.height * 0.055,
                          ),
                    onPressed: () {
                      setState(() {
                        currenttap = !currenttap;
                      });
                    },
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
                            size: MediaQuery.of(context).size.height * 0.1,
                          )),
                    )),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
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
                      widget.movies[widget.currentIndex].title,
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
                      widget.movies[widget.currentIndex].year.toString(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.05,
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
              children: [
                CustomButton(
                  text: widget.movies[widget.currentIndex].runtime.toString(),
                  isIcon: true,
                  icon: Icons.timer,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
