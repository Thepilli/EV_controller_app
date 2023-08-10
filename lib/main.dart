import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tesla_controller/constants/colors.dart';
import 'package:tesla_controller/screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    debugPrint(screenSize.toString());
    return ScreenUtilInit(
        designSize: const Size(411.4, 866.3),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Tesla Controller',
            theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: AppColors.darkBg,
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        });
  }
}
