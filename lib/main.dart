import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/all_cast.dart';
import 'package:rick_and_morty/features/bottomNav/bottom_nav.dart';

import 'features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        BottomNav.routeName: (_) => const BottomNav(),
      },
    );
  }
}
