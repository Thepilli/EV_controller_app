import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> tyres(BoxConstraints constraints) {
  return [
    Positioned(
      top: constraints.maxHeight * .23.h,
      right: constraints.maxWidth * .21.w,
      child: SvgPicture.asset('assets/icons/tyre.svg'),
    ),
    Positioned(
      top: constraints.maxHeight * .23.h,
      left: constraints.maxWidth * .21.w,
      child: SvgPicture.asset('assets/icons/tyre.svg'),
    ),
    Positioned(
      bottom: constraints.maxHeight * .23.h,
      right: constraints.maxWidth * .21.w,
      child: SvgPicture.asset('assets/icons/tyre.svg'),
    ),
    Positioned(
      bottom: constraints.maxHeight * .23.h,
      left: constraints.maxWidth * .21.w,
      child: SvgPicture.asset('assets/icons/tyre.svg'),
    ),
  ];
}
