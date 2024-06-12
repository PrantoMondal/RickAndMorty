import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/details/cast_screen.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/diagonal_cut_painter.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

import '../../utils/custom_app_bar.dart';
import '../../utils/screen_size.dart';

class AllCast extends StatelessWidget {
  static const String routeName = '/home';

  const AllCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RnMColors.blackColor,
      body: Container(
        height: screenHeight(context, 1),
        width: screenWidth(context, 1),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const CustomAppBar(
              showBackButton: false,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Cast",
                  style: RnMTextStyles.plusJakartaSans_600_22
                      .copyWith(color: RnMColors.secondaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CastScreen.routeName);
                    },
                    child: CustomPaint(
                      painter: DiagonalCutPainter(),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/rick.png',
                              height: screenHeight(context, 0.15),
                              width: screenWidth(context, 0.4),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rick Sanchez",
                              style: RnMTextStyles.plusJakartaSans_600_22
                                  .copyWith(
                                      fontSize: 10,
                                      color: RnMColors.whiteColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
