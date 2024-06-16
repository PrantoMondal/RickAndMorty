import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/details/bloc/cast_details_bloc.dart';
import 'package:rick_and_morty/features/details/cast_screen.dart';
import 'package:rick_and_morty/features/home/all_cast.dart';
import 'package:rick_and_morty/features/bottomNav/bottom_nav.dart';
import 'package:rick_and_morty/features/home/bloc/all_cast_bloc.dart';

import 'features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllCastBloc>(
          create: (context) => AllCastBloc()..add(AllCastInitialFetchEvent(1)),
        ),
        BlocProvider<CastDetailsBloc>(
          create: (context) =>
              CastDetailsBloc()..add(CastDetailsInitialFetchEvent("1")),
        ),
      ],
      child: MaterialApp(
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
          CastScreen.routeName: (_) => const CastScreen(
                id: '1',
              ),
        },
      ),
    );
  }
}
