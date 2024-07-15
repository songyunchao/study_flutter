import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color textColor;
  final double elevation;
  final ShapeBorder shape;
  final double minWidth;
  final double height;
  final EdgeInsetsGeometry padding;
  final bool enableFeedback;
  final Widget child;



  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.elevation = 2.0,
    this.shape = const RoundedRectangleBorder(
      // borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.minWidth = 88.0,
    this.height = 36.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.enableFeedback = true, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      elevation: elevation,
      shape: shape,
      minWidth: minWidth,
      height: height,
      padding: padding,
      enableFeedback: enableFeedback,
      child: child,
    );
  }
}


