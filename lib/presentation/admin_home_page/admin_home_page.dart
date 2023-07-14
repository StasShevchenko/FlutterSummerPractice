import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/admin_add_user_page/admin_add_user_page.dart';
import 'package:flutter_summer_practice/presentation/admin_home_page/admin_home_page_provider.dart';
import 'package:flutter_summer_practice/presentation/admin_home_page/components/user_item.dart';
import 'package:flutter_summer_practice/presentation/admin_user_details/admin_user_details_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme/app_colors.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget companyIcon = SvgPicture.asset(
      'assets/icons/company_icon.svg',
      width: 35,
      height: 35,
    );

    return ChangeNotifierProvider<AdminHomePageProvider>(
      create: (context) => AdminHomePageProvider(),
      builder: (context, _) {
        var provider =
            Provider.of<AdminHomePageProvider>(context, listen: true);
        var state = provider.state!;
        return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              leading: Center(child: companyIcon),
              title: Text('Сотрудники (Воронеж)'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (!(state.errorMessage == null)) ...{
                      Text(
                        state.errorMessage!,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          provider.updateRequest();
                        },
                        child: Text('Обновить страницу'),
                      )
                    } else if (state.isLoading) ...{
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBlue,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdminAddUserPage()));
                        },
                        child: Text('Добавить сотрудника'),
                      )
                    } else ...{
                      if (state.users.isEmpty)
                        Expanded(
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                provider.updateRequest();
                              },
                              child: Text(
                                'Список сотрудников пуст :(',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async => provider.updateRequest(),
                            child: ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: UserItem(
                                    userInfo: state.users[index],
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UserDetailsPage(
                                                    userData:
                                                        state.users[index],
                                                  )));
                                    },
                                    onDelete: () {
                                      provider
                                          .deleteUser(state.users[index].id);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdminAddUserPage()));
                        },
                        child: Text('Добавить сотрудника'),
                      )
                    }
                  ],
                ),
              ),
            ));
      },
    );
  }
}
