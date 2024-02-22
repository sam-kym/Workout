import 'package:flutter/material.dart';
import 'package:gym/utils/styles.dart';
import 'package:gym/view/complete_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: appTheme,
      home: const CompleteProfile(),
    );
  }
}
