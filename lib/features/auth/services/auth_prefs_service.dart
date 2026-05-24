import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefsService {
  AuthPrefsService._();

  static final AuthPrefsService _instance = AuthPrefsService._();
  static AuthPrefsService get instance => _instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> saveToken(String token) async {
    final prefs = await _prefs;
    return prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await _prefs;
    return prefs.getString('token');
  }

  Future<bool> saveRefreshToken(String token) async {
    final prefs = await _prefs;
    return prefs.setString('refreshToken', token);
  }

  Future<String?> getRefreshToken() async {
    final prefs = await _prefs;
    return prefs.getString('refreshToken');
  }

  Future<void> removeTokens() async {
    final prefs = await _prefs;
    prefs.remove('token');
    prefs.remove('refreshToken');
  }
}
