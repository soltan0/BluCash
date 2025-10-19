import 'package:blue_cash/features/auth/screen/conform_a_pincode_screen.dart';
import 'package:blue_cash/features/auth/screen/create_a_pincode_screen.dart';
import 'package:blue_cash/features/auth/screen/firstnamelastname_screen.dart';
import 'package:blue_cash/features/auth/screen/opt_screen.dart';
import 'package:blue_cash/features/auth/screen/register_screen.dart';
import 'package:blue_cash/features/screen/home/home_screen.dart';
import 'package:blue_cash/features/screen/pin_code_sreen.dart';
import 'package:blue_cash/features/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    routes: [
      GoRoute(path: AppRoutes.splash.path, builder: (_, __) => const SplashScreen()),
      GoRoute(path: AppRoutes.opt.path, builder: (_, __) => const OptScreen()),
      GoRoute(path: AppRoutes.firstNameLastName.path, builder: (_, __) => const FirstnamelastnameScreen()),
      GoRoute(path: AppRoutes.CreateAPincode.path, builder: (_, __) => CreateAPincodeScreen()),
      GoRoute(path: AppRoutes.pinCode.path, builder: (_, __) => const PinCodeSreen()),
      GoRoute(path: AppRoutes.ConformAPincode.path, builder: (_, _) => ConformAPincodeScreen()),
      GoRoute(path: AppRoutes.home.path, builder: (_, __) => const HomeScreen()),
      GoRoute(path: AppRoutes.register.path, builder: (_, _) => RegisterScreen()),
    ],
  );
}
