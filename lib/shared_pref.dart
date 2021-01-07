import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class StorageUtil {
  static StorageUtil _storageUtil;
  static SharedPreferences _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveToken(String authToken){
    return _preferences.setString('auth_token', authToken);
  }

  static String getToken(){
    String token = _preferences.getString('auth_token');
    return token;
  }

  static Future<bool> saveUserId(String userId){
    return _preferences.setString('user_id', userId);
  }

  static String getUserId(){
    String userId = _preferences.getString('user_id');
    return userId;
  }

  static Future<bool>saveEmail(String email){
     return _preferences.setString('email', email);
  }

  static Future<bool>setLoginStatus(bool status){
    if(status!=null){
      return _preferences.setBool('is_LoggenIn', status);
    }
  }

  static Future<bool>saveMobile(String mobile){
     return _preferences.setString('mobile', mobile);
  }

  static Future<bool>saveFName(String fname){
    return _preferences.setString('fname', fname);
  }

  static Future<bool>saveLName(String lname){
    return _preferences.setString('lname', lname);
  }

  static Future<bool>saveImage(String img){
    return _preferences.setString('image', img);
  }

  static Future<bool>saveAddress(String address){
    return _preferences.setString('address', address);
  }

 static String getEmail(){
    String email = _preferences.getString('email');
    return email;
 } 

 static String getMobile(){
    String mobile = _preferences.getString('mobile');
    return mobile;
 }

  static String getFName(){
   String fname = _preferences.getString('fname');
   return fname;
 }

  static String getLName(){
    String lname = _preferences.getString('lname');
    return lname;
  }
  static bool isLoggedIn(){
    return _preferences.getBool('is_LoggenIn') ?? false;
  }
}

