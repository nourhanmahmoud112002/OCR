import 'package:flutter/material.dart';
import 'package:scan_image/core/utils/classes/app_routes.dart';
import 'package:scan_image/core/utils/functions/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(const ScanImage());
}

class ScanImage extends StatelessWidget {
  const ScanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
