import 'package:dio/dio.dart';
import 'package:flutter_summer_practice/data/remote_data_source/user_remote_data.dart';
import 'package:flutter_summer_practice/utils/resource.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../dto/user_dto.dart';

class UserRepository{
  final UserRemoteData userRemoteData = UserRemoteData();

  Stream<Resource<List<UserDto>>> getUsers() async*{
    try{
      yield const Loading();
      var connectionResult = await InternetConnectionChecker().hasConnection;
      if(connectionResult){
        var usersList = await userRemoteData.getAllUsers();
        yield Success(data: usersList);
      } else{
        yield const Error(message: 'Ошибка соединения! Проверьте ваше подключение к интернету!');
      }
    } on DioException catch(e) {
      yield Error(message: e.message);
    }
  }
}