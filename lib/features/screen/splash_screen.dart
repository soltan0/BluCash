import 'package:blue_cash/app/router/app_routes.dart';
import 'package:blue_cash/core/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ super.key });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
    super.initState(); 
    
    Future.delayed(Duration(seconds: 3), () {
    context.go(AppRoutes.register.path);
    });
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Center(child: Image.asset(AppImage.logo))
       );
  }
}