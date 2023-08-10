import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_controller/constants/colors.dart';

class TeslaBottomNavigationBar extends StatelessWidget {
  const TeslaBottomNavigationBar({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.darkBg,
      items: List.generate(
        navigationIconSource.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            navigationIconSource[index],
            height: 40,
            color: index == selectedTab ? AppColors.jPrimaryColor : AppColors.grey,
          ),
          label: '',
        ),
      ),
    );
  }
}

List<String> navigationIconSource = [
  'assets/icons/tab_lock.svg',
  'assets/icons/tab_charge.svg',
  'assets/icons/tab_temperature.svg',
  'assets/icons/tab_tyre.svg',
];
