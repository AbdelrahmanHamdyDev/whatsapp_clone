import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/appTheme.dart';
import 'package:whatsapp_clone/pageView.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeAnimationDuration: Duration(milliseconds: 500),
          themeAnimationCurve: Curves.linear,
          home: child,
        );
      },
      child: const BottomNavWithPageView(),
    ),
  );
}
