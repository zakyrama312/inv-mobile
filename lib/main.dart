import 'package:flutter/material.dart';
import 'ui/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ventera App',
      // MaterialApp inilah yang memberikan "Directionality"
      home: LoginView(),
    );
  }
}
