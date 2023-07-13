import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AdminAddUserPage extends StatefulWidget {
  const AdminAddUserPage({super.key});

  @override
  State<AdminAddUserPage> createState() => _AdminAddUserPageState();
}

class _AdminAddUserPageState extends State<AdminAddUserPage> {
  String name = '';
  String group = '';

  String? nameErrorText;
  String? groupErrorText;

  void _enterName(String name) {
    setState(() {
      nameErrorText = null;
      this.name = name.trim();
    });
  }

  void _enterGroup(String group){
    setState(() {
      groupErrorText = null;
      this.group = group.trim();
    });
  }

  void _createUser() async{
    if (name.isEmpty) {
      nameErrorText = 'Введите имя сотрудника!';
    }
    if (group.isEmpty) {
      groupErrorText = 'Введите отделение сотрудника!';
    }
    if (nameErrorText != null || groupErrorText != null) {
      return;
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryWhite,), onPressed: () {Navigator.of(context).pop();},),
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
              onChanged: (value) => _enterName(value),
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
              onChanged: (value) => _enterName(value),
              decoration: InputDecoration(
                  labelText: 'Рабочий отдел сотрудника', errorText: nameErrorText),
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
      )
    );
  }
}
