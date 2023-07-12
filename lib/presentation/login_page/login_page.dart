import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_page/home_page.dart';
import '../theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void _login() {
    setState(() {
      if (login.isEmpty) {
        loginErrorText = 'Логин не может быть пустым!';
      }
      if (password.isEmpty) {
        passwordErrorText = 'Пароль не должен быть пустым!';
      }
      if (loginErrorText != null || passwordErrorText != null) {
        return;
      } else {
        if (login == 'Михаил' && password == 'Михаил') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(
                    title: 'Привет, Мишаня!',
                  )));
        } else if (login == 'Admin' && password == 'Admin') {
        } else {
          loginErrorText = 'Неверный логин!';
          passwordErrorText = 'Неверный пароль!';
        }
      }
    });
  }

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
          title: const Text('Авторизация'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Добро пожаловать!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                child: TextField(
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) => _enterLogin(value),
                  decoration: InputDecoration(
                      labelText: 'Введите логин', errorText: loginErrorText),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (value) => _enterPassword(value),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Введите пароль',
                      errorText: passwordErrorText),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: _login,
                    child: const Text('Войти'),
                  )),
            ],
          ),
        ));
  }
}
