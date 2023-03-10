import 'package:ando_kitchen_order/views/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/router/utils.dart';

class AndoApp extends StatelessWidget {
  const AndoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1336, 1024),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: (settings) =>
              Routers.generateRoute(settings, context),
          debugShowCheckedModeBanner: false,
          title: 'Ando Order',
          theme: ThemeData(fontFamily: "IBMPlexSans"),
          home: child,
        );
      },
      child: const SignInView(),
    );
  }
}
