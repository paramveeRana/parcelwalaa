import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parcelwalaa/ui/home/mobile/home_mobile_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth >= 600) { //for web
          return ScreenUtilInit(
            designSize: const Size(1366, 1685),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:
                (context, child) =>
                MaterialApp(debugShowCheckedModeBanner: false, home: child),
            // child: WebHomeUi(),
            // child:  SpaAndBeautyUi(),
          );
        } else {
          return ScreenUtilInit( //for mobile
            designSize: const Size(375, 809),
            minTextAdapt: true,
            splitScreenMode: true,
            builder:
                (context, child) =>
                MaterialApp(debugShowCheckedModeBanner: false, home: child),
            // child: GymDetailMobileUi(),
            child: HomeMobileUi(),
          );
        }
      },
    );
  }
}
