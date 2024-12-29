import 'package:flutter/material.dart';
import 'package:movieapp/core/widgets/custom_fading.dart';
import 'package:movieapp/features/profile/presentation/screens/widgets/custom_button.dart';
import 'package:movieapp/features/profile/presentation/screens/widgets/custom_item.dart';

class ProfileBodyView extends StatefulWidget {
  const ProfileBodyView({super.key});

  @override
  State<ProfileBodyView> createState() => _ProfileBodyViewState();
}

class _ProfileBodyViewState extends State<ProfileBodyView> {
  final bool currentTap = false;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.amberAccent,
                            )),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.amberAccent,
                          ),
                        )
                      ],
                    ),
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
                            text: 'Edit Profile',
                            icon: Icons.edit,
                            onTap: () {
                              
                            },
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
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      icon: Icons.list,
                      text: "My Favorite Movies",
                      onTap: () {},
                    ),
                    CustomButton(
                      icon: Icons.list,
                      text: "My Watchlist",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7),
                itemCount: 10,
                itemBuilder: (context, index) => CustomFadingWidget(
                      child: Container(
                        color: Colors.grey,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
