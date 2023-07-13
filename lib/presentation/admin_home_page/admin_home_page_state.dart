import '../../data/dto/user_dto.dart';

class AdminHomePageState {
  List<UserDto> users = [];
  String? errorMessage;
  bool isLoading = true;

  AdminHomePageState(
      {this.users = const [], this.errorMessage, this.isLoading = true});
}
