import 'package:go_router/go_router.dart';
import 'package:scan_image/core/utils/classes/singleton.dart';
import 'package:scan_image/features/home/presentation/views/home.dart';
import 'package:scan_image/features/onboarding/presentation/views/onboarding.dart';

// GoRouter configuration

class AppRouter {
  static const kHomePage = '/home';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            bool isStarted =
                Singleton.sharedPerference.getBool('isStarted') ?? false;
            if (isStarted) {
              return const HomePage();
            } else {
              return const OnBoardingPage();
            }
          }),
      GoRoute(
        path: kHomePage,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
