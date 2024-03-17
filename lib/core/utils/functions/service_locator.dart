import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
