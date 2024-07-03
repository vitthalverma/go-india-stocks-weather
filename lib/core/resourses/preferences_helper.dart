import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _lastSearchedCityKey = 'last_searched_city';

  static Future<void> saveLastSearchedCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastSearchedCityKey, city);
  }

  static Future<String?> getLastSearchedCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastSearchedCityKey);
  }
}
