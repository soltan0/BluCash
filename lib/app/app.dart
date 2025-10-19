import 'package:blue_cash/app/router/app_router.dart';
import 'package:blue_cash/provider/pin_put_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/pin_input_provider.dart';

class BC extends StatelessWidget {
  const BC({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PinPutProvider()),
            ChangeNotifierProvider(create: (context) => PinInputProvider()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
