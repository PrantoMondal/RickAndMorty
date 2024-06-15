import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/details/cast_screen.dart';
import 'package:rick_and_morty/features/home/bloc/all_cast_bloc.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/diagonal_cut_painter.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

import '../../utils/custom_app_bar.dart';
import '../../utils/screen_size.dart';

class AllCast extends StatefulWidget {
  static const String routeName = '/home';

  const AllCast({super.key});

  @override
  State<AllCast> createState() => _AllCastState();
}

class _AllCastState extends State<AllCast> {
  final AllCastBloc allCastBloc = AllCastBloc();
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    allCastBloc.add(AllCastInitialFetchEvent(currentPage));
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMoreCharacters();
      }
    });
    super.initState();
  }

  void _fetchMoreCharacters() {
    currentPage++;

    allCastBloc.add(AllCastInitialFetchEvent(currentPage));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    allCastBloc.close();
    // TODO: implement dispose
    super.dispose();
  }

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
            BlocBuilder<AllCastBloc, AllCastState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case const (AllCastInitial):
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ),
                    );
                  case const (AllCastFetchSuccessfulState):
                    final successState = state as AllCastFetchSuccessfulState;
                    return Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: successState.allCastModel.results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, CastScreen.routeName,arguments: successState.allCastModel.results[index].id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CastScreen(
                                        id: successState
                                            .allCastModel.results[index].id),
                                  ));
                            },
                            child: CustomPaint(
                              painter: DiagonalCutPainter(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      successState
                                          .allCastModel.results[index].image,
                                      height: screenHeight(context, 0.15),
                                      width: screenWidth(context, 0.4),
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      successState
                                          .allCastModel.results[index].name,
                                      style: RnMTextStyles
                                          .plusJakartaSans_600_22
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
                    );
                  default:
                    const CircularProgressIndicator();
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
