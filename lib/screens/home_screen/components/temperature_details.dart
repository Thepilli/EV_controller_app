import 'package:flutter/material.dart';
import 'package:tesla_controller/constants/applystyle.dart';
import 'package:tesla_controller/constants/colors.dart';
import 'package:tesla_controller/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:tesla_controller/screens/home_screen/components/temperature_button.dart';

class TemperatureDetails extends StatelessWidget {
  const TemperatureDetails({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TemperatureButton(
                  iconPath: 'assets/icons/coolShape.svg',
                  label: 'COOL',
                  onTap: _controller.updateCoolSelectedTab,
                  isActive: _controller.isCoolSelected,
                  activeColor: AppColors.coolActive,
                ),
                TemperatureButton(
                  iconPath: 'assets/icons/heatShape.svg',
                  label: 'HEAT',
                  onTap: _controller.updateCoolSelectedTab,
                  isActive: !_controller.isCoolSelected,
                  activeColor: AppColors.heatActive,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 40,
                  color: AppColors.jPrimaryColor,
                ),
              ),
              Text(
                "28" "\u2103",
                style: appstyle(80, AppColors.jPrimaryColor, FontWeight.w300),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                  color: AppColors.jPrimaryColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'CURRENT TEMPERATURE',
            style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'INSIDE',
                    style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300),
                  ),
                  Text(
                    "22" "\u2103",
                    style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    'OUTSIDE',
                    style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300),
                  ),
                  Text(
                    "35" "\u2103",
                    style: appstyle(15, AppColors.jPrimaryColor, FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
