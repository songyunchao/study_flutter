

import 'package:flutter/material.dart';
import 'package:study_flutter/page/login_page.dart';
import 'package:study_flutter/page/registration_page.dart';
import 'package:study_flutter/util/color.dart';

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
        primarySwatch: white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   RegistrationPage(onJumpToLogin: () { print("跳转到登录页面"); },),
      // home:   const LoginPage(),
    );
  }
}
