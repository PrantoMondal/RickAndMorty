import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/details/bloc/cast_details_bloc.dart';
import 'package:rick_and_morty/utils/box_painter.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/custom_app_bar.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

import '../../utils/screen_size.dart';

class CastScreen extends StatefulWidget {
  final String id;
  static const String routeName = '/cast';

  const CastScreen({super.key, required this.id});

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  final CastDetailsBloc castDetailsBloc = CastDetailsBloc();

  @override
  void initState() {
    print(" called .................");
    castDetailsBloc.add(CastDetailsInitialFetchEvent(widget.id));
    // TODO: implement initState
    super.initState();
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
              showBackButton: true,
            ),
            BlocConsumer<CastDetailsBloc, CastDetailsState>(
                bloc: castDetailsBloc,
                listenWhen: (prev, cur) => cur is CastDetailsActionState,
                buildWhen: (prev, cur) => cur is! CastDetailsActionState,
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case CastDetailsInitial:
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      );
                    case CastDetailsFetchSuccessfulState:
                      final successState =
                          state as CastDetailsFetchSuccessfulState;
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  successState.castDetailsModel.name!,
                                  style: RnMTextStyles.plusJakartaSans_600_22
                                      .copyWith(
                                          color: RnMColors.secondaryColor),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomPaint(
                                  painter: BoxShapePainter(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Image.network(
                                      successState.castDetailsModel.image!,
                                      height: 160,
                                      width: 160,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    buildCustomBox1(
                                      imageUrl: 'assets/images/icons/heart.png',
                                      title: "Status",
                                      subTitle:
                                          successState.castDetailsModel.status!,
                                    ),
                                    buildCustomBox1(
                                      imageUrl:
                                          'assets/images/icons/species.png',
                                      title: "Species",
                                      subTitle: successState
                                          .castDetailsModel.species!,
                                    ),
                                    buildCustomBox1(
                                      imageUrl:
                                          'assets/images/icons/gender.png',
                                      title: "Gender",
                                      subTitle:
                                          successState.castDetailsModel.gender!,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildCustomBox2(
                                  imageUrl: 'assets/images/icons/earth.png',
                                  title: "Origin",
                                  subTitle:
                                      successState.castDetailsModel.origin!,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildCustomBox2(
                                  imageUrl: 'assets/images/icons/location.png',
                                  title: "Last Known Location",
                                  subTitle:
                                      successState.castDetailsModel.location!,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomPaint(
                                  painter: BoxShapePainter(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                              'assets/images/icons/menu.png'),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "Episode(s)",
                                            style: RnMTextStyles
                                                .plusJakartaSans_600_22
                                                .copyWith(
                                              fontSize: 10,
                                              color: RnMColors.whiteColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemCount: successState
                                                .castDetailsModel
                                                .episodes!
                                                .length,
                                            itemBuilder: (context, index) {
                                              return buildTextRow(
                                                  text: successState
                                                      .castDetailsModel
                                                      .episodes![index]
                                                      .name!);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    default:
                      const CircularProgressIndicator();
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }

  buildTextRow({required String text}) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.circle,
          color: RnMColors.whiteColor,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: RnMTextStyles.plusJakartaSans_400_14.copyWith(
            fontSize: 17,
            color: RnMColors.whiteColor,
          ),
        ),
      ],
    );
  }

  buildCustomBox1({
    required String imageUrl,
    required String title,
    required String subTitle,
  }) {
    return CustomPaint(
      painter: BoxShapePainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: RnMTextStyles.plusJakartaSans_600_22.copyWith(
                  fontSize: 10,
                  color: RnMColors.whiteColor,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                subTitle,
                style: RnMTextStyles.plusJakartaSans_400_14.copyWith(
                  fontSize: 17,
                  color: RnMColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCustomBox2({
    required String imageUrl,
    required String title,
    required String subTitle,
  }) {
    return CustomPaint(
      painter: BoxShapePainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: RnMTextStyles.plusJakartaSans_600_22.copyWith(
                  fontSize: 10,
                  color: RnMColors.whiteColor,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subTitle,
                    style: RnMTextStyles.plusJakartaSans_400_14.copyWith(
                      fontSize: 17,
                      color: RnMColors.whiteColor,
                    ),
                  ),
                  Image.asset('assets/images/icons/vector.png')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
