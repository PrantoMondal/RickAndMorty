import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/home/all_cast.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/screen_size.dart';
import 'cubit/bottom_nav_cubit.dart';

class BottomNav extends StatelessWidget {
  static const String routeName = '/bottomNav';
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          int selectedIndex;
          if (state is BottomNavHome) {
            selectedIndex = 0;
          } else if (state is BottomNavCast) {
            selectedIndex = 1;
          } else {
            selectedIndex = 0;
          }

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              backgroundColor: RnMColors.blackColor,
              unselectedItemColor: RnMColors.whiteColor,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Cast',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: RnMColors.primaryColor,
              onTap: (index) =>
                  context.read<BottomNavCubit>().updateIndex(index),
            ),
            body: Center(
              child: IndexedStack(
                index: selectedIndex,
                children: const <Widget>[
                  AllCast(),
                  Center(child: Text('Message Page')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
