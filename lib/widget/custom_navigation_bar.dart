
import 'package:flutter/material.dart';

enum StatusStyle {
  LIGHT_CONTENT,
  DARK_CONTENT
}
//可自定义样式的沉浸式导航栏
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, this.statusStyle = StatusStyle.DARK_CONTENT ,  this.color =Colors.white,   this.height =46, required this.child, });

  final StatusStyle statusStyle  ;
  final Color color;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    _statusBarInit();
    //状态栏高度
    var top = MediaQuery.of(context).padding.top;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height+top,
      child: child,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(
        color:color
      ),
    );
  }

  void _statusBarInit() {
    //沉浸式状态栏样式

  }
}
