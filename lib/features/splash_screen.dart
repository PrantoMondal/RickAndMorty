import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/all_cast.dart';
import 'package:rick_and_morty/features/bottomNav/bottom_nav.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/screen_size.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, BottomNav.routeName);
    });
    return Scaffold(
      backgroundColor: RnMColors.primaryColor,
      body: Stack(
        children: [
          Container(
            height: screenHeight(context, 1),
            width: screenWidth(context, 1),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/rick_and_morty_splash.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              child: Column(
                children: [
                  const CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 5,
                    color: RnMColors.blackColor,
                    backgroundColor: RnMColors.greyColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Loading",
                    style: RnMTextStyles.plusJakartaSans_400_14.copyWith(
                        color: RnMColors.blackColor,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
