import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_summer_practice/data/dto/add_user_dto.dart';

import '../dto/user_dto.dart';

class UserRemoteData{
  final Dio dio = Dio();

  Future<List<UserDto>> getAllUsers() async {
    final response = await dio.get('http://62.113.110.235:3000/user');

    List<dynamic> data = response.data as List;
    List<UserDto> usersList = [];

    for(var user in data) {
      usersList.add(UserDto.fromJson(user));
    }

    return usersList;
  }

  Future<void> addUser(AddUserDto user) async {
    await dio.post('http://62.113.110.235:3000/user', data: user.toJson());
  }

}