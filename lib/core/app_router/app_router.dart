import 'package:design_test_app/features/home/presentation/pages/home_screen.dart';
import 'package:get/get.dart';

import '../../features/location/presentation/pages/location_screen.dart';

class AppRouter {
  static const String homeScreenRoute = Route.HOME_SCREEN;
  static const String splashScreenRoute = Route.SPLASH_SCREEN;
  static const String locationScreenRoute = Route.LOCATION_SCREEN;

  static final routes = [
    GetPage(
      name: homeScreenRoute,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: locationScreenRoute,
      page: () => LocationScreen(),
    ),
  ];
}

class Route {
  static const String SPLASH_SCREEN = '/';
  static const String HOME_SCREEN = '/home';
  static const String LOCATION_SCREEN = '/location';
}
