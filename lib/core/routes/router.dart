import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/layout/bottom_nav_layout.dart';
import '../../ui/screens/auth/login/login_screen.dart';
import '../../ui/screens/auth/register/create_account_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/history/history_screen.dart';
import '../../ui/screens/onboarding/onboarding_screen.dart';
import '../../ui/screens/onboarding/splash_screen.dart';
import '../../ui/screens/products/products_screen.dart';
import '../../ui/screens/profile/profile_screen.dart';
import '../../ui/screens/wallet/wallet_screen.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final scaffoldKey = GlobalKey<ScaffoldState>();
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

final router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  restorationScopeId: "app",
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Paths.SPLASH,
      name: Routes.SPLASH,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Paths.LOGIN,
      name: Routes.LOGIN,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Paths.SIGNUP,
      name: Routes.SIGNUP,
      builder: (context, state) => const CreateAccountScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Paths.ONBOARDING,
      name: Routes.ONBOARDING,
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, child) => BottomNavLayout(child: child),
      routes: [
        GoRoute(
          path: Paths.HOME,
          name: Routes.HOME,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Paths.PRODUCTS,
          name: Routes.PRODUCTS,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: Paths.WALLET,
          name: Routes.WALLET,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const WalletScreen(),
        ),
        GoRoute(
          path: Paths.PROFILE,
          name: Routes.PROFILE,
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),

    GoRoute(
      path: Paths.HISTORY,
      name: Routes.HISTORY,
      parentNavigatorKey: _shellNavigatorKey,
      builder: (context, state) => const HistoryScreen(),
    ),
  ],
);
