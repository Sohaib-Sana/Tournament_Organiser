import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences prefs;

  static const _keyUserEmail = 'UserEmail'; // Done.
  static const _keyFreindName = 'friendName'; // Rehti hai
  static const _keyLastMessageTime = 'lastMessageTime'; // Rehti hai
  static const _keyLastMessage = 'lastMessage'; // Rehti hai
  static const _keyLastSeen = 'lastSeen'; // Rehti hai
  static const _keyUserName = 'userName'; // Done.
  static const _keyUserId = 'uid'; // Done.
  static const _keyStatus = 'status'; // Done.

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setUserEmail(String userEmail) async {
    await prefs.setString(_keyUserEmail, userEmail);
  }

  static Future setFriendName(String friendName) async {
    await prefs.setString(_keyFreindName, friendName);
  }

  static Future setLastMessageTime(String lastMessageTime) async {
    await prefs.setString(_keyLastMessageTime, lastMessageTime);
  }

  static Future setLastMessage(String lastMessage) async {
    await prefs.setString(_keyLastMessage, lastMessage);
  }

  static Future setLastSeen(String lastSeen) async {
    await prefs.setString(_keyLastSeen, lastSeen);
  }

  static Future setUserName(String userName) async {
    await prefs.setString(_keyUserName, userName);
  }

  static Future setUserId(String uid) async {
    await prefs.setString(_keyUserId, uid);
  }

  static Future setStatus(bool status) async {
    await prefs.setBool(_keyStatus, status);
  }

  static String? getUserEmail() => prefs.getString(_keyUserEmail);
  static String? getFriendName() => prefs.getString(_keyFreindName);
  static String? getLastMessageTime() => prefs.getString(_keyLastMessageTime);
  static String? getLastMessage() => prefs.getString(_keyLastMessage);
  static String? getLastSeen() => prefs.getString(_keyLastSeen);
  static String? getUserName() => prefs.getString(_keyUserName);
  static String? getUserId() => prefs.getString(_keyUserId);
  static bool? getStatus() => prefs.getBool(_keyStatus);
}
