part of 'ocr_cubit.dart';

@immutable
sealed class OcrState {}

final class PickImageInitial extends OcrState {}

final class PickImageLoading extends OcrState {}

final class PickImageSuccess extends OcrState {
  final File pickedImage;
  PickImageSuccess({required this.pickedImage});
}

final class PickImageFailure extends OcrState {
  final String errorMessage;
  PickImageFailure({required this.errorMessage});
}

final class ExtractedTextLoading extends OcrState {}

final class ExtractedTextSuccess extends OcrState {
  final String extractedText;
  ExtractedTextSuccess({required this.extractedText});
}

final class ExtractedTextFailure extends OcrState {
  final String errorMessage;
  ExtractedTextFailure({required this.errorMessage});
}
