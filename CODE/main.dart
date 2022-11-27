import 'package:flutter/material.dart';
import 'UIs/home.dart';

void main() async {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePageUI()));
}
