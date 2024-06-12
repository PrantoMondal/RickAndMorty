import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

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
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 48,
            ),
            Divider(
              height: 12,
              color: Colors.white.withOpacity(0.3),
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
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CustomPaint(
                    size: const Size(200, 200),
                    painter: DiagonalCutPainter(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/rick.png'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Rick Sanchez",
                            style: RnMTextStyles.plusJakartaSans_600_22
                                .copyWith(
                                    fontSize: 10, color: RnMColors.whiteColor),
                          )
                        ],
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

class DiagonalCutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;

    const Gradient borderGradient = LinearGradient(
      colors: [RnMColors.primaryColor, RnMColors.secondaryColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final borderPaint = Paint()
      ..shader = borderGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 1)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
