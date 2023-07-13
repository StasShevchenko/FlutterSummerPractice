import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/data/dto/user_dto.dart';
import 'package:flutter_summer_practice/presentation/theme/app_colors.dart';
import 'package:intl/intl.dart';
class UserItem extends StatelessWidget {
  final Function onTap;
  final UserDto userInfo;
  const UserItem({super.key, required this.userInfo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('MM/dd/yyyy');
    DateTime startDate = dateFormat.parse(userInfo.startTime).toUtc();
    DateTime endDate = dateFormat.parse(userInfo.endTime).toUtc();
    var startDateString = DateFormat('dd.MM.yyyy').format(startDate);
    var endDateString = DateFormat('dd.MM.yyyy').format(endDate);

    return Card(
      surfaceTintColor: AppColors.primaryWhite,
      color: AppColors.primaryWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(userInfo.name, style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 10,),
            Text('Отделение сотрудника: ${userInfo.group}'),
            const SizedBox(height: 10,),
            if(userInfo.isActive) Text('Статус сотрудника: парковка доступна', style: TextStyle(color: AppColors.primaryAccentRed),)
            else Text('Статус пользователя: парковка недоступна', style: TextStyle(color: AppColors.primaryBlue),),
            const SizedBox(height: 10,),
            Text('Следующий срок использования парковки: $startDateString - $endDateString', textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
