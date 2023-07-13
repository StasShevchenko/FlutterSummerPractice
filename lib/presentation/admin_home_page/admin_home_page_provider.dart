import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_summer_practice/data/repository/user_repository.dart';
import 'package:flutter_summer_practice/presentation/admin_home_page/admin_home_page_state.dart';
import 'package:flutter_summer_practice/utils/resource.dart';

class AdminHomePageProvider extends ChangeNotifier {
  final userRepository = UserRepository();
  AdminHomePageState? state = AdminHomePageState();

  StreamSubscription? subscription;

  AdminHomePageProvider() {
    _listenUserData();
  }

  void updateRequest() {
    _listenUserData();
  }

  void _listenUserData() {
    subscription?.cancel();
    subscription = userRepository.getUsers().listen((event) {
      switch (event) {
        case Success _:
          {
            state = AdminHomePageState(
                users: event.data!, isLoading: false, errorMessage: null);
            notifyListeners();
          }
        case Loading _:
          {
            state = AdminHomePageState(
                users: [], isLoading: true, errorMessage: null);
            notifyListeners();
          }
        case Error _:
          {
            state = AdminHomePageState(
                users: [], isLoading: false, errorMessage: event.message);
            notifyListeners();
          }
      }
    });
  }
}
