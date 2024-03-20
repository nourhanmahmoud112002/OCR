import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scan_image/constants.dart';
import 'package:scan_image/features/home/presentation/manager/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:scan_image/features/home/presentation/views/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const HomeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => BlocProvider.of<OcrCubit>(context)
              .copyExtractedTextToClipboard(context: context),
          backgroundColor: kPrimaryColor,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.copy,
            size: 30,
            color: Colors.white,
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
