import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/data/dto/user_credentials.dart';
import 'package:flutter_summer_practice/data/remote_data_source/user_remote_data.dart';
import 'package:flutter_summer_practice/presentation/admin_home_page/admin_home_page.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/dto/user_dto.dart';
import '../home_page/home_page.dart';
import '../theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserRemoteData userRemoteData = UserRemoteData();

  String login = '';
  String password = '';

  String? loginErrorText;
  String? passwordErrorText;

  void _enterLogin(String login) {
    setState(() {
      loginErrorText = null;
      this.login = login.trim();
    });
  }

  void _enterPassword(String password) {
    setState(() {
      passwordErrorText = null;
      this.password = password.trim();
    });
  }

  void _login() async {
    setState(() {
      if (login.isEmpty) {
        loginErrorText = 'Логин не может быть пустым!';
      }
      if (password.isEmpty) {
        passwordErrorText = 'Пароль не должен быть пустым!';
      }
    });
    if (loginErrorText != null || passwordErrorText != null) {
      return;
    } else if (login == 'Admin' && password == 'Admin') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const AdminHomePage()));
    } else {
      UserCredentials userCredentials =
          UserCredentials(name: login, uniqueKey: password);
      UserDto? userData = await userRemoteData.auth(userCredentials);
      if (userData != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  HomePage(
                  userData: userData,
                )));
      } else {
        setState(() {
          loginErrorText = 'Неверный логин!';
          passwordErrorText = 'Неверный пароль!';
        });
      }
    }

    // setState(() {
    //   if (loginErrorText != null || passwordErrorText != null) {
    //     return;
    //   } else {
    //     if (login == 'Михаил' && password == 'Михаил') {
    //       Navigator.of(context).push(MaterialPageRoute(
    //           builder: (context) => const HomePage(
    //                 title: 'Привет, Мишаня!',
    //               )));
    //     } else if (login == 'Admin' && password == 'Admin') {
    //       Navigator.of(context).push(
    //           MaterialPageRoute(builder: (context) => const AdminHomePage()));
    //     } else {
    //       loginErrorText = 'Неверный логин!';
    //       passwordErrorText = 'Неверный пароль!';
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final Widget companyIcon = SvgPicture.asset(
      'assets/icons/company_icon.svg',
      width: 35,
      height: 35,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Center(child: companyIcon),
        title: const Text('Авторизация'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              child: Text(
                'Добро пожаловать!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) => _enterLogin(value),
              decoration: InputDecoration(
                  labelText: 'Введите логин', errorText: loginErrorText),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              onChanged: (value) => _enterPassword(value),
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Введите пароль', errorText: passwordErrorText),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(
                  'Войти',
                  style: TextStyle(letterSpacing: 1.5),
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
