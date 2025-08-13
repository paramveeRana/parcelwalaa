import 'package:easy_localization/easy_localization.dart';
import 'package:parcelwalaa/framework/dependency_injection/inject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parcelwalaa/ui/home/mobile/home_mobile_ui.dart';


final globalNavigatorKey = GlobalKey<NavigatorState>();


void main() async {
  await Hive.initFlutter();

  /// Ensuring initialization for EasyLocalization
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureMainDependencies(environment: Env.debug);

  /// Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'lang',
        startLocale: Locale('en'),
        fallbackLocale: Locale('en'),
        saveLocale: false,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
        locale: context.locale,
        key: globalNavigatorKey,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        home: child,
      ),
      child: HomeMobileUi(),
      // child:  SpaAndBeautyUi(),
    );
  }
}
