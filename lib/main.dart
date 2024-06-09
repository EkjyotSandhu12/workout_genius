import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'common/theme/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'common/helpers/initializer.dart';
import 'common/route/router.dart';
import 'common/services/screen_properties_service.dart';
import 'common/theme/text_styles.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors().getScaffoldBackgroundColor,
    ),
  );

  Initializer.init(
    () {
      runApp(const InitMaterialApp());
    },
  );
}

class InitMaterialApp extends StatelessWidget {
  const InitMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenPropertiesService().updateScreenProperties(MediaQuery.of(context));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors().getScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors().getScaffoldBackgroundColor,
          titleTextStyle: TextStyles().getAppBarTextStyle,
        ),
        //inkwell splash delay fix
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(
              allowEnterRouteSnapshotting: false,
            ),
          },
        ),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: ValueListenableBuilder(
            valueListenable: AppColors().isDarkTheme,
            builder: (BuildContext context, bool value, Widget? c) => child!,
          ),
        ),
        breakpoints: [],
      ),
      routerConfig: router,
    );
  }
}
