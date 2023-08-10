import 'package:flutter/material.dart';
import 'package:tesla_controller/constants/applystyle.dart';
import 'package:tesla_controller/constants/colors.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text(
            '220 km',
            style: appstyle(35, AppColors.jPrimaryColor, FontWeight.w300, height: 1.2),
          ),
          Text(
            '69 %',
            style: appstyle(20, AppColors.jPrimaryColor, FontWeight.w100, height: 1.2),
          ),
          const Spacer(
            flex: 4,
          ),
          Text(
            'CHARGING',
            style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300, height: 1.2),
          ),
          Text(
            textAlign: TextAlign.center,
            '18 min \nremaining',
            style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300, height: 1.2),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '33 km/hr',
                style: appstyle(20, AppColors.jPrimaryColor, FontWeight.w300, height: 1.2),
              ),
              Text(
                '232 V',
                style: appstyle(20, AppColors.jPrimaryColor, FontWeight.w300, height: 1.2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
