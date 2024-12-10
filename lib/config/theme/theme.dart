import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
  Colors.brown,
  Colors.teal,
  Colors.pink,
 ]; 

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }): assert(selectedColor >= 0, "El color seleccionado debe tener una valor mayor que 0"),
      assert(selectedColor < colorList.length - 1, 
      "El color debe ser menor o igual que ${colorList.length}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true, 
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
}