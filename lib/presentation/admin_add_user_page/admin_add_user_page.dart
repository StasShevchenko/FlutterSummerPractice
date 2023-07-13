import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/data/dto/add_user_dto.dart';
import 'package:flutter_summer_practice/data/dto/user_dto.dart';
import 'package:flutter_summer_practice/data/remote_data_source/user_remote_data.dart';

import '../theme/app_colors.dart';

class AdminAddUserPage extends StatefulWidget {
  const AdminAddUserPage({super.key});

  @override
  State<AdminAddUserPage> createState() => _AdminAddUserPageState();
}

class _AdminAddUserPageState extends State<AdminAddUserPage> {
  UserRemoteData userRemoteData = UserRemoteData();
  final _nameController = TextEditingController();
  final _groupController = TextEditingController();

  String get name => _nameController.text;

  String get group => _groupController.text;

  String? nameErrorText;
  String? groupErrorText;

  Future<void> _createUser() async {
    print(name);
    print(group);
    if (name.isEmpty) {
      nameErrorText = 'Введите имя сотрудника!';
    }
    if (group.isEmpty) {
      groupErrorText = 'Введите отделение сотрудника!';
    }
    if (nameErrorText != null || groupErrorText != null) {
      return;
    } else {
      AddUserDto user = AddUserDto(name: name, group: group);
      await userRemoteData.addUser(user);
      if(!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Пользователь был добавлен!')));
      _nameController.clear();
      _groupController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primaryWhite,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Создание сотрудника'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Имя сотрудника ', errorText: nameErrorText),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                controller: _groupController,
                decoration: InputDecoration(
                    labelText: 'Рабочий отдел сотрудника',
                    errorText: nameErrorText),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _createUser();
                },
                child: Text('Добавить сотрудника'),
              )
            ],
          ),
        ));
  }
}
