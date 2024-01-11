import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final bool taskComplete;
  final Function(bool?)? onChanged;
  const CustomTextBox({super.key, this.onChanged, required this.taskComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Checkbox(value: taskComplete, onChanged: onChanged),
    );
  }
}
