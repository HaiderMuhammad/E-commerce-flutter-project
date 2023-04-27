import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_e_commerce/app/core/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {

  Future<UserModel?> get getUser async{
    try{
      UserModel userModel = await _getUserData();
      return userModel;
    }catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }


  _getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString('user');
    return UserModel.fromJson(jsonDecode(value!));
  }


  setUser(UserModel userModel) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('user', jsonEncode(userModel.toJson()));
  }

  void _removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }

  get removeUser => _removeUser();
}