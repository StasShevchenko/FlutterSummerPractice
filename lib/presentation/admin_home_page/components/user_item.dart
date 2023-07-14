import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/data/dto/user_dto.dart';
import 'package:flutter_summer_practice/presentation/theme/app_colors.dart';
import 'package:intl/intl.dart';

class UserItem extends StatelessWidget {
  final Function onTap;
  final Function onDelete;
  final UserDto userInfo;

  const UserItem(
      {super.key,
      required this.userInfo,
      required this.onTap,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('MM/dd/yyyy');
    DateTime startDate = dateFormat.parse(userInfo.startTime).toUtc();
    DateTime endDate = dateFormat.parse(userInfo.endTime).toUtc();
    var startDateString = DateFormat('dd.MM.yyyy').format(startDate);
    var endDateString = DateFormat('dd.MM.yyyy').format(endDate);

    Widget cancelButton = TextButton(
      child: Text("Отмена", style: Theme.of(context).textTheme.bodyMedium,),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Подтвердить", style: Theme.of(context).textTheme.bodyMedium,),
      onPressed:  () {
        Navigator.of(context).pop();
        onDelete();
      },
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.primaryWhite,
      surfaceTintColor: AppColors.primaryWhite,
      title: Text('Подтверждение удаления', ),
      content: Text('Вы действительно хотите удалить сотрудника ${userInfo.name}?'),
      actions: [
        cancelButton,
        continueButton
      ],
    );
    return GestureDetector(
      onTap: (){onTap();},
      child: Card(
        surfaceTintColor: AppColors.primaryWhite,
        color: AppColors.primaryWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                userInfo.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Отделение сотрудника: ${userInfo.group}'),
              const SizedBox(
                height: 10,
              ),
              if (userInfo.isActive)
                Text(
                  'Статус сотрудника: парковка доступна',
                  style: TextStyle(color: AppColors.primaryAccentRed),
                )
              else
                Text(
                  'Статус пользователя: парковка недоступна',
                  style: TextStyle(color: AppColors.primaryBlue),
                ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Следующий срок использования парковки: $startDateString - $endDateString',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                }, );
                          },
                      icon: const Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
