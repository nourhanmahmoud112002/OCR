import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_image/core/utils/classes/app_routes.dart';
import 'package:scan_image/core/utils/classes/singleton.dart';
import 'package:scan_image/features/home/presentation/manager/cubits/ocr_cubit/ocr_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Singleton.init();
  runApp(const ScanImage());
}

class ScanImage extends StatelessWidget {
  const ScanImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OcrCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
