import 'package:flutter/material.dart';

double screenHeight(BuildContext context, double partialSize) {
  var screenHeight = MediaQuery.of(context).size.height;
  return screenHeight * partialSize;
}

double screenWidth(BuildContext context, double partialSize) {
  var screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * partialSize;
}
