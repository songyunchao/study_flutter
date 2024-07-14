import 'package:flutter/material.dart';
import 'package:study_flutter/util/color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
        required this.titile,
        this.enable = true,
        required this.onPressed});

  final String  titile;
  final bool enable;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  FractionallySizedBox(
      widthFactor: 1,
      child:  MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        height: 45,
        onPressed: enable ? onPressed : null,
        disabledColor: primary[50],
        color: primary,
        textColor: Colors.white,
        child:  Text(titile,style: const TextStyle(fontSize: 16),),
      ),
    );
  }
}
