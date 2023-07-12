import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/home_page/components/calendar/calendar.dart';
import 'package:flutter_summer_practice/presentation/theme/app_colors.dart';
import 'package:flutter_summer_practice/presentation/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
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
      theme: appTheme(),
      darkTheme: appTheme(),
      home: Listener(
          onPointerDown: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: const MyHomePage(title: 'Привет, Мишаня!')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 35,
                width: 35,
                child: IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/bell_icon.svg',),),
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

            const Calendar(startTime: '7/11/2023', endTime: '7/13/2023', isActive: true,),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('404'),
            ),

          ],
        ),
      ),
    );
  }
}
