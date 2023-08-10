import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_controller/constants/colors.dart';
import 'package:tesla_controller/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:tesla_controller/models/tyre_psi.dart';
import 'package:tesla_controller/screens/home_screen/components/battery_status.dart';
import 'package:tesla_controller/screens/home_screen/components/door_lock.dart';
import 'package:tesla_controller/screens/home_screen/components/temperature_details.dart';
import 'package:tesla_controller/screens/home_screen/components/tesla_bottom_navigation_bar.dart';
import 'package:tesla_controller/screens/home_screen/components/tyre_psi_cards.dart';
import 'package:tesla_controller/screens/home_screen/components/tyres.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  late AnimationController _temperatureAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationGlow;

  late AnimationController _tyreAnimationController;
  //to animate each tyre one by one
  late Animation<double> _animationTyre1Psi;
  late Animation<double> _animationTyre2Psi;
  late Animation<double> _animationTyre3Psi;
  late Animation<double> _animationTyre4Psi;

  late List<Animation<double>> _tyreAnimations;

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      //starts on 0 and ends at half => after 300ms, as total duration is set to 600, to match the rest
      curve: const Interval(0.0, 0.5),
    );
    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      //starts at half and ends at 1 => after 300ms, as total duration is set to 600, to match the rest
      curve: const Interval(0.6, 1.0),
    );
  }

  void setupTemperatureAnimation() {
    _temperatureAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationCarShift = CurvedAnimation(
      parent: _temperatureAnimationController,
      curve: const Interval(0.2, 0.4),
    );
    _animationTempShowInfo = CurvedAnimation(
      parent: _temperatureAnimationController,
      curve: const Interval(0.45, 0.65),
    );
    _animationGlow = CurvedAnimation(
      parent: _temperatureAnimationController,
      curve: const Interval(0.7, 1.0),
    );
  }

  void setupTyreAnimation() {
    _tyreAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animationTyre1Psi = CurvedAnimation(parent: _tyreAnimationController, curve: const Interval(0.34, 0.5));
    _animationTyre2Psi = CurvedAnimation(parent: _tyreAnimationController, curve: const Interval(0.5, 0.66));
    _animationTyre3Psi = CurvedAnimation(parent: _tyreAnimationController, curve: const Interval(0.66, 0.82));
    _animationTyre4Psi = CurvedAnimation(parent: _tyreAnimationController, curve: const Interval(0.82, 1));
    _tyreAnimations = [
      _animationTyre1Psi,
      _animationTyre2Psi,
      _animationTyre3Psi,
      _animationTyre4Psi,
    ];
  }

  @override
  void initState() {
    setupBatteryAnimation();
    setupTemperatureAnimation();
    setupTyreAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _temperatureAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation:
          Listenable.merge([_controller, _batteryAnimationController, _temperatureAnimationController, _tyreAnimationController]),
      builder: (context, snapshot) {
        debugPrint(_animationBattery.value.toString());
        return Scaffold(
          bottomNavigationBar: TeslaBottomNavigationBar(
            onTap: (index) {
              if (index == 1) {
                _batteryAnimationController.forward();
              } else if (_controller.selectedBottomTab == 1 && index != 1) {
                _batteryAnimationController.reverse(from: 0.7);
              }

              if (index == 2) {
                _temperatureAnimationController.forward();
              } else if (_controller.selectedBottomTab == 2 && index != 2) {
                _temperatureAnimationController.reverse(from: 0.4);
              }

              if (index == 3) {
                _tyreAnimationController.forward();
              } else if (_controller.selectedBottomTab == 3 && index != 3) {
                _tyreAnimationController.reverse();
              }

              _controller.showTyreController(index);
              _controller.tyreStatusController(index);
              _controller.onButtonNavigationTabChange(index);
            },
            selectedTab: _controller.selectedBottomTab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    //sets the whole screen available for positioning
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    //Car Model
                    Positioned(
                      left: constraints.maxWidth / 2 * _animationCarShift.value,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * .1),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          width: double.infinity,
                        ),
                      ),
                    ),
                    // Right Lock
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _controller.selectedBottomTab == 0 ? constraints.maxWidth * .05 : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateRightDoorLock,
                          isLock: _controller.isRightDoorLock,
                        ),
                      ),
                    ),
                    // Left Lock
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _controller.selectedBottomTab == 0 ? constraints.maxWidth * .05 : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateLeftDoorLock,
                          isLock: _controller.isLeftDoorLock,
                        ),
                      ),
                    ),
                    // Front Lock
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _controller.selectedBottomTab == 0 ? constraints.maxHeight * .13 : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateFrunkDoorLock,
                          isLock: _controller.isFrunkDoorLock,
                        ),
                      ),
                    ),
                    // Back Lock
                    AnimatedPositioned(
                      duration: defaultDuration,
                      bottom: _controller.selectedBottomTab == 0 ? constraints.maxHeight * .17 : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                        child: DoorLock(
                          press: _controller.updateTrunkDoorLock,
                          isLock: _controller.isTrunkDoorLock,
                        ),
                      ),
                    ),
                    // Battery
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        'assets/icons/battery.svg',
                        color: AppColors.jPrimaryColor,
                        width: constraints.maxWidth / 2,
                      ),
                    ),
                    // Battery Status
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: constraints,
                        ),
                      ),
                    ),
                    //Temperature details
                    Positioned(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      top: 60 * (1 - _animationTempShowInfo.value),
                      child: Opacity(
                        opacity: _animationTempShowInfo.value,
                        child: TemperatureDetails(controller: _controller),
                      ),
                    ),
                    //Temperature Glow
                    Positioned(
                      right: -180 * (1 - _animationGlow.value),
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _controller.isCoolSelected
                            ? Image.asset(
                                'assets/images/glow_cool.png',
                                width: 200.w,
                                key: UniqueKey(),
                              )
                            : Image.asset(
                                'assets/images/glow_heat.png',
                                width: 200.w,
                                key: UniqueKey(),
                              ),
                      ),
                    ),
                    //Tyres
                    if (_controller.isShowTyres) ...tyres(constraints),
                    if (_controller.isShowTyreStatus)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: constraints.maxWidth / constraints.maxHeight,
                              crossAxisCount: 2),
                          itemCount: 4,
                          itemBuilder: (context, index) => ScaleTransition(
                            scale: _tyreAnimations[index],
                            child: TyrePsiCard(
                              isBottomTyre: index > 1,
                              tyrePsi: tyrePsiList[index],
                            ),
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
