//登录动效
import 'package:flutter/material.dart';

class LoginEffect extends StatefulWidget {
  const LoginEffect({super.key, required this.protect});

  final bool protect;

  @override
  State<LoginEffect> createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: const Border(bottom: BorderSide( color: Color(0xFF000000),)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(true),
          Image(image: AssetImage('images/login_center.png'),height: 90,width: 90),
          _image(false),
        ],
      ),
    );
  }

  _image(bool left) {
    var headerLeft  = widget.protect?'images/login_effect_left.png':'images/login_left.png';
    var headerRight = widget.protect?'images/login_effect_left.png':'images/login_left.png';
    return Image(image: AssetImage(left?headerLeft:headerRight),height: 90,width: 90);
  }
}
