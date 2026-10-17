import 'package:bullpen/onboarding/intent_screen.dart';
import 'package:bullpen/onboarding/onboarding_screen.dart';
import 'package:bullpen/splashscreen/splash_screen.dart';

import '../_lib.dart';

class AppPages {
  static const initialRoute = Routes.splashRoute;
  static Map<String, WidgetBuilder> routes = {
    ///Routes.dashboardRoute: (context) => const DashboardScreen(),
    Routes.onboardingPath: (context) => const OnboardingScreen(),
    Routes.splashRoute: (context) => const SplashScreen(),
    Routes.intentRoute: (context) => const IntentScreen(),
  };
}
