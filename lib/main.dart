import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/home_page/home_page.dart';
import 'package:flutter_summer_practice/presentation/theme/app_theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('ru').then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: Listener(
          onPointerDown: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: const HomePage(title: 'Привет, Мишаня!')),
    );
  }
}
