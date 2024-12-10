import 'package:flutter/material.dart';
import 'package:me_perdonas2/config/theme/theme.dart';
import 'package:me_perdonas2/presentation/screens/me_perdonas_screen/me_perdonas_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 4).getTheme(),
      home: const MePerdonasScreen()
    );
  }
}
