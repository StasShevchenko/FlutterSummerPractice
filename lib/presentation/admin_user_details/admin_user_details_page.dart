import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_summer_practice/data/dto/user_dto.dart';

import '../theme/app_colors.dart';

class UserDetailsPage extends StatelessWidget {
  final UserDto userData;
  const UserDetailsPage({super.key, required this.userData});

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
          title: const Text('Информация о сотруднике'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Имя сотрудника: ${userData.name}', style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 20,),
              Text('Начало периода парковки: ${userData.startTime}', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20,),
              Text('Конец периода парковки: ${userData.endTime}', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20,),
              const Text('Ключ для входа:'),
              const SizedBox(height: 10,),
              InkWell(
                onLongPress: (){
                  Clipboard.setData(ClipboardData(text: userData.uniqueKey));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ключ скопирован!')));
                },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${userData.uniqueKey}'),
                  )
              )
            ],
          ),
        )
    );
  }
}
