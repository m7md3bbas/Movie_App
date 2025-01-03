import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/core/widgets/custom_button.dart';
import 'package:movieapp/core/widgets/custom_fading.dart';
import 'package:movieapp/presentation/Home/screens/widgets/Custom_movie_image.dart';
import 'package:movieapp/presentation/Profile/screens/widgets/custom_item.dart';
import 'package:movieapp/presentation/moviedetails/manager/cubit/moviedetails_cubit.dart';
import 'package:movieapp/presentation/moviedetails/screens/movie_details.dart';

class ProfileBodyView extends StatefulWidget {
  const ProfileBodyView({super.key});

  @override
  State<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends State<ProfileBodyView> {
  int currentTap = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              child: Image.asset(
                                'assets/images/avatar1.png',
                                scale: 1,
                              ),
                            ),
                            Container(
                              width: 150,
                              child: Text(
                                'Mohamed  Abbas',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomItem(
                          number: "50",
                          text: "Followers",
                        ),
                        CustomItem(
                          number: "100",
                          text: "Favorite movies",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            isIcon: true,
                            width: MediaQuery.of(context).size.width * 0.40,
                            text: 'Edit Profile',
                            icon: Icons.edit,
                            color: Theme.of(context).colorScheme.surface,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        isIcon: true,
                        width: MediaQuery.of(context).size.width * 0.40,
                        icon: Icons.list,
                        text: "Favorite Movies",
                        color: currentTap == 0
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.surface,
                        onTap: () => setState(() {
                          currentTap = 0;
                        }),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                          isIcon: true,
                          width: MediaQuery.of(context).size.width * 0.40,
                          icon: Icons.list,
                          text: "My Watchlist",
                          color: currentTap == 2
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.surface,
                          onTap: () => setState(() {
                                currentTap = 2;
                              })),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<MoviedetailsCubit, MoviedetailsState>(
              bloc: Get.find<MoviedetailsCubit>(),
              builder: (context, state) {
                if (state is MoviedetailsLoadded) {
                  return SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 0.7),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) => CustomMovieImage(
                            ontap: () {
                              Get.to(() => MovieDetails(
                                    currentIndex: index,
                                    movies: state.movies,
                                  ));
                            },
                            image: state.movies[index].orginalImage,
                            rating: state.movies[index].rating,
                          ));
                }
                if (state is MoviedetailsLoading) {
                  return SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 0.7),
                      itemCount: 10,
                      itemBuilder: (context, index) => CustomFadingWidget(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 250,
                              width: 200,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ));
                }
                return SliverToBoxAdapter(
                    child: SizedBox(
                  child: Image.asset('assets/images/Empty.png'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
