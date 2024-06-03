import 'package:advertisement_app/config/routes/routing_settings_args_models.dart';
import 'package:flutter/material.dart';
import '../../constants/page_transition.dart';
import '../../screens/auth/screens/login_screen/view/login_main_screen.dart';
import '../../screens/auth/screens/sign_uo_screen/view/sign_up_main_screen.dart';
import '../../screens/dashboard/main_dashboard_screen/screens/dashboard_main_screen.dart';
import '../../screens/dashboard/main_dashboard_screen/screens/main_home_screen/my_home_tabbar_screen.dart';
import '../../screens/image_preview_screens/screens/image_preview_main_screen.dart';
import '../../screens/dashboard/main_dashboard_screen/screens/widgets/home_page_tablet_web_tab_widget.dart';
import '../../screens/location_update/screens/location_update_main_screen.dart';
import '../../screens/onboarding/screens/view/onboarding_main_screen.dart';
import 'route_constants.dart';
import '../../screens/network_home_page/initial_page.dart';
import '../../screens/network_home_page/network_home_page.dart';
import '../../screens/splash/screens/splash_screen.dart';

/// this is app router class
/// this class is used for named routing
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return PageTransition(const SplashScreen());
      case AppRoutes.logInMainScreen:
        return PageTransition(const LogInMainScreen());
      case AppRoutes.signUpMainScreen:
        return PageTransition(const SignUpMainScreen());
      case AppRoutes.onBoardingMainScreen:
        return PageTransition(const OnBoardingMainScreen());
      case AppRoutes.newtWorkScreen:
        return PageTransition(const NetWorkHomePage());
      case AppRoutes.dashboardScreen:
        return PageTransition(const DashboardMainScreen());
      case AppRoutes.myHomeTabBarScreen:
        return PageTransition(const MyHomeTabBarScreen());

        case AppRoutes.homePageTabletWebTabWidget:
        return PageTransition(const HomePageTabletWebTabWidget());

      case AppRoutes.locationUpdateMainScreen:
        return PageTransition(const LocationUpdateMainScreen());

      case AppRoutes.imagePreviewMainScreen:
        final args = settings.arguments as ImagePreviewScreenArgs;
        return PageTransition(ImagePreviewMainScreen(
          imageData: args.imagesList ?? [],
        ));
      default:
        return MaterialPageRoute(builder: (_) => const InitiallyHomePage());
    }
  }
}
