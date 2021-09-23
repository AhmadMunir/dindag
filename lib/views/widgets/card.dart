import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;

  const Card({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color ?? Colors.blue[700],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: child);
  }
}