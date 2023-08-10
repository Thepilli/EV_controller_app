import 'package:flutter/material.dart';
import 'package:tesla_controller/constants/applystyle.dart';
import 'package:tesla_controller/constants/colors.dart';
import 'package:tesla_controller/models/tyre_psi.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    super.key,
    required this.isBottomTyre,
    required this.tyrePsi,
  });
  final TyrePsi tyrePsi;
  final bool isBottomTyre;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: tyrePsi.isLowPressure ? AppColors.heatActive : AppColors.jPrimaryColor, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: tyrePsi.isLowPressure ? AppColors.heatActive.withOpacity(.1) : AppColors.whiteColor.withOpacity(.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isBottomTyre
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  lowPressreText(),
                  const Spacer(),
                  psiText(psi: tyrePsi.psi.toString(), temp: tyrePsi.temp.toString()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  psiText(psi: tyrePsi.psi.toString(), temp: tyrePsi.temp.toString()),
                  const Spacer(),
                  lowPressreText(),
                ],
              ),
      ),
    );
  }

  Column lowPressreText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "LOW",
          style: appstyle(40, tyrePsi.isLowPressure ? AppColors.heatActive : AppColors.jPrimaryColor, FontWeight.bold),
        ),
        Text(
          "PRESSURE",
          style: appstyle(20, tyrePsi.isLowPressure ? AppColors.heatActive : AppColors.jPrimaryColor, FontWeight.w100),
        ),
      ],
    );
  }

  Column psiText({required String psi, required String temp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$psi psi",
          style: appstyle(30, tyrePsi.isLowPressure ? AppColors.heatActive : AppColors.jPrimaryColor, FontWeight.w500),
        ),
        Text(
          "$temp" "\u2103",
          style: appstyle(15, tyrePsi.isLowPressure ? AppColors.heatActive : AppColors.jPrimaryColor, FontWeight.w100),
        ),
      ],
    );
  }
}
