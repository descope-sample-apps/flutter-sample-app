import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/home_screen.dart';
import 'package:flutter_sample_app/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: true ? const WelcomeScreen() : const HomeScreen(),
    );
  }
}
