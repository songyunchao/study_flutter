//登录输入框 自定义widget
import 'package:flutter/material.dart';
import 'package:study_flutter/util/color.dart';

class LoginInput extends StatefulWidget {
  const LoginInput(
       {super.key,
        required this.title,
        required this.hint,
        this.onChanged,
        this.focusChanged,
        this.lineStretch = false,
        this.obscureText = false,
        this.keyboardType}
      );

  final String title;
  final String  hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStretch;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //是否获取光标的监听
    _focusNode.addListener(() {
      if(widget.focusChanged !=null){
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              width: 100,
              child: Text(widget.title,style: const TextStyle(fontSize: 16),),
            ),
            _input(),
          ],
        ),
        Padding(padding: EdgeInsets.only(left:!widget.lineStretch?15:0),
          child: const Divider(
            height: 1,
            thickness: 0.5,
          )
          ,)
      ],
    );
  }

  _input() {
    return Expanded(child:
      TextField(
        autofocus:  widget.obscureText,
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        cursorColor: primary,
        style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300),
        //输入框的样式
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20,right: 20),
          hintText: widget.hint??'',
          border: InputBorder.none,
          hintStyle: const TextStyle(fontSize: 15,color: Colors.grey, ),
        ),
      )
    );
  }
}
