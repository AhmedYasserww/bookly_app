import 'package:flutter/cupertino.dart';

abstract class Styles
{
  static TextStyle textStyle18(context) {
    return TextStyle(
    fontWeight: FontWeight.w600,
fontSize:getResponsiveFontSize(context, fontSize: 18),
    );

  }

  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle30(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 30),
      fontWeight: FontWeight.normal,
      fontFamily: "GTSectraFine",
    );
  }
  static double getResponsiveFontSize(context, {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;
    // print(
    //     "fontSize = $fontSize,LowerLimit = $lowerLimit,UpperLimit = $upperLimit , responsive fontSize = $responsiveFontSize,finalFontSize = ${responsiveFontSize
    //         .clamp(lowerLimit, upperLimit)}");

    responsiveFontSize.clamp(lowerLimit, upperLimit);
    return responsiveFontSize;
  }

  static double getScaleFactor(context) {
    // var dispatcher = PlatformDispatcher.instance;
    // var physicalWidth = dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    // var width = physicalWidth / devicePixelRatio;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    if (width <800) {
      return width / 550;
    }  else {
      return width / 1600;
    }
  }
}