import 'package:dio/dio.dart';
import 'package:flutter_summer_practice/data/remote_data_source/user_remote_data.dart';
import 'package:flutter_summer_practice/utils/resource.dart';

import '../dto/user_dto.dart';

class UserRepository{
  final UserRemoteData userRemoteData = UserRemoteData();

  Stream<Resource<List<UserDto>>> getUsers() async*{
    try{
      yield const Loading();
      var usersList = await userRemoteData.getAllUsers();
      yield Success(data: usersList);
    } on DioException catch(e) {
      yield Error(message: e.message);
    }
  }
}