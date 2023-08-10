import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_controller/constants/applystyle.dart';
import 'package:tesla_controller/constants/colors.dart';

class TemperatureButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;
  const TemperatureButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.isActive = false,
    required this.onTap,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            curve: Curves.easeInOutBack,
            duration: const Duration(milliseconds: 200),
            height: isActive ? 80.h : 50.h,
            width: isActive ? 80.w : 50.w,
            child: SvgPicture.asset(
              iconPath,
              color: isActive ? activeColor : AppColors.whiteColor,
            ),
          ),
          const SizedBox(height: 5),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: appstyle(14, isActive ? activeColor : AppColors.whiteColor, isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(
              label,
            ),
          )
        ],
      ),
    );
  }
}
