
import 'package:flutter/material.dart';

class  SizeConfig {
    static MediaQueryData? _mediaQueryData;
    static double? screenWidth;
    static double? screenHight;
    static Orientation? orientation;
    static double? defaultSize;
    void init(BuildContext context){
      _mediaQueryData  = MediaQuery.of(context);
      screenWidth = _mediaQueryData!.size.width;
      screenHight = _mediaQueryData!.size.height;
      orientation = _mediaQueryData!.orientation;

      defaultSize = orientation== Orientation.landscape?
      screenHight! * 0.024
      : screenWidth! * 0.024;
    }
}