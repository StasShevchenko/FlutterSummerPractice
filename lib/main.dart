import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/theme/app_colors.dart';
import 'package:flutter_summer_practice/presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Row(
             children: [
               Text('Статус:', style: Theme.of(context).textTheme.bodyLarge,),
               const SizedBox(width: 10,),
               const Expanded(
                 child: TextField(
                   enabled: false,
                   decoration: InputDecoration(
                     labelText: 'Парковка доступна!'
                   ),
                 ),
               )
             ],
           ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('Место:', style: Theme.of(context).textTheme.bodyLarge,),
                const SizedBox(width: 10,),
                const Expanded(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        labelText: '512'
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Text('404'), style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),)
          ],
        ),
      ),
    );
  }
}
