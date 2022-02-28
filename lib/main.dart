import 'package:flutter/material.dart';
import 'package:pomo_timer/theme/theme_style.dart';
import 'package:pomo_timer/widgets/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomo timer',
      theme: defaultTheme(),
      home: HomePage(),
    );
  }
}
