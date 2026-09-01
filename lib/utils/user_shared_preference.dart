import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';


class UserSharedPreference{
    static const String _languageKey = 'selected_language';
    static const String _locationKey = 'location';
  static const String _userKey = 'userData';
  static const _token ="token";


  static Future<void> saveLanguage(String languageCode) async { 
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }

    static Future<void> saveLocation(String locationCode) async { 
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_locationKey, locationCode);
  }

  static Future<String?> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_locationKey);
  }

  static Future<void> saveUser(Map<String, dynamic>? userData) async {
    final prefs = await SharedPreferences.getInstance();
    if (userData != null) {
      String encodedData = jsonEncode(userData);
      await prefs.setString(_userKey, encodedData);
    }
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

static Future<void> saveResponse(String key, dynamic data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, jsonEncode(data));
}

static Future<dynamic> getResponse(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString(key);
  if (jsonString == null) return null;
  return jsonDecode(jsonString); 
}

  static Future<void> clearResponse(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_token);
    await prefs.remove(_languageKey);
    await prefs.remove(_locationKey);
  }

    static Future<void> saveToken(String token) async { 
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
    log('the token: $token');
  }

  static Future<String?> getSavedToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
  Future<void> savePendingLog(Map<String, dynamic> answers) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> pendingLogs = prefs.getStringList("pendingLogs") ?? [];
  pendingLogs.add(jsonEncode(answers));
  await prefs.setStringList("pendingLogs", pendingLogs);
}

Future<List<Map<String, dynamic>>> getPendingLogs() async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> pendingLogs = prefs.getStringList("pendingLogs") ?? [];
  return pendingLogs.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
}

Future<void> clearPendingLogs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("pendingLogs");
}
}