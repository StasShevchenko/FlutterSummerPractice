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
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  String get name => _nameController.text;

  String get group => _groupController.text;

  String get startDate => _startDateController.text;

  String get endDate => _endDateController.text;

  String? nameErrorText;
  String? groupErrorText;
  String? startDateErrorText;
  String? endDateErrorText;

  Future<void> _createUser() async {
    if (name.isEmpty) {
      nameErrorText = 'Введите имя сотрудника!';
    }
    if (group.isEmpty) {
      groupErrorText = 'Введите отделение сотрудника!';
    }
    if (startDate.isEmpty) {
      startDateErrorText = 'Введите дату!';
    }
    if (endDate.isEmpty) {
      endDateErrorText = 'Введите дату!';
    }
    if (nameErrorText != null ||
        groupErrorText != null ||
        startDateErrorText != null ||
        endDateErrorText != null) {
      return;
    } else {
      AddUserDto user = AddUserDto(
          name: name, group: group, startTime: startDate, endTime: endDate);
      await userRemoteData.addUser(user);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Сотрудник был добавлен!')));
      _nameController.clear();
      _groupController.clear();
      _startDateController.clear();
      _endDateController.clear();
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
              Navigator.of(context).pop(true);
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
                onChanged: (value) => nameErrorText = null,
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
                onChanged: (value) => groupErrorText = null,
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
              TextField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                onChanged: (value) => startDateErrorText = null,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                controller: _startDateController,
                decoration: InputDecoration(
                    labelText: 'Дата начала парковки',
                    errorText: nameErrorText),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onTapOutside: (_) => FocusScope.of(context).unfocus(),
                textInputAction: TextInputAction.next,
                onChanged: (value) => endDateErrorText = null,
                textCapitalization: TextCapitalization.sentences,
                controller: _endDateController,
                decoration: InputDecoration(
                    labelText: 'Дата конца парковки', errorText: nameErrorText),
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
