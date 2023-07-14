import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/dto/user_dto.dart';
import '../theme/app_colors.dart';
import 'components/calendar/calendar.dart';

class HomePage extends StatelessWidget {
  final UserDto userData;

  const HomePage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final Widget companyIcon = SvgPicture.asset(
      'assets/icons/company_icon.svg',
      width: 35,
      height: 35,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Center(child: companyIcon),
        title: Text('Привет, ${userData.name}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(10)),
                height: 35,
                width: 35,
                child: IconButton(
                  onPressed: () {Navigator.of(context).pop();},
                  icon: SvgPicture.asset(
                    'assets/icons/bell_icon.svg',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Статус:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: TextField(
                    enabled: false,
                    decoration:
                    InputDecoration(labelText: 'Парковка доступна!'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Место:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(labelText: '512'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Card(
                  color: AppColors.primaryWhite,
                  surfaceTintColor: AppColors.primaryWhite,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Calendar(
                      startTime: userData.startTime,
                      endTime: userData.endTime,
                      isActive: true,
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: AppColors.primaryAccentRed,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                Text(' дни доступа к парковке')

              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //       minimumSize: const Size.fromHeight(50)),
            //   child: const Text('Личный кабинет'),
            // ),
          ],
        ),
      ),
    );
  }
}
