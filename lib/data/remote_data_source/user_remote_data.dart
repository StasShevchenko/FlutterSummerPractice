import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../dto/user_dto.dart';

class UserRemoteData{
  final Dio dio = Dio();

  Future<List<UserDto>> getAllUsers() async {
    final response = await dio.get('http://62.113.110.235:3000/user');

    print(response.data);
    List<dynamic> data = response.data as List;
    List<UserDto> usersList = [];

    for(var user in data) {
      usersList.add(UserDto.fromJson(user));
    }

    return usersList;
  }
}