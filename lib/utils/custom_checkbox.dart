import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gym/utils/colors.dart';
import 'package:gym/widget/terms.dart';

class CustomCheckBox extends StatelessWidget {
  final bool taskComplete;
  final Function(bool?)? onChanged;
  final String taskName;
  final String? richTextName;
  const CustomCheckBox(
      {super.key,
      this.onChanged,
      required this.taskComplete,
      required this.taskName, this.richTextName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: scaffoldBackgroundColor),
      child: Row(
        children: [
          Checkbox(value: taskComplete, onChanged: onChanged),
          Text(
            taskName,
            style: TextStyle(
                decoration: taskComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          RichText(text:TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: 15
            ),
            children: [
              TextSpan(
                text: richTextName,
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                .. onTap= () => Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditions()))
              )
            ]
          ) )
        ],
      ),
    );
  }
}
