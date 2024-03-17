import 'package:shared_preferences/shared_preferences.dart';

class Singleton {
  //private named constructor
  Singleton._internal();

  //singleton instance
  static final Singleton singleton = Singleton._internal();

  static late final SharedPreferences sharedPerference;

  static Future<SharedPreferences> init() async =>
      sharedPerference = await SharedPreferences.getInstance();
}
