import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/screen_size.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBackButton;
  const CustomAppBar({super.key, required this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              showBackButton == true
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox(),
              const Spacer(),
              Image.asset(
                'assets/images/logo.png',
                height: 48,
                width: screenWidth(context, 0.7),
              ),
              const Spacer(),
              showBackButton == true
                  ? const SizedBox(
                      width: 30,
                    )
                  : const SizedBox()
            ],
          ),
        ),
        Divider(
          height: 12,
          color: Colors.white.withOpacity(0.3),
        ),
      ],
    );
  }
}
