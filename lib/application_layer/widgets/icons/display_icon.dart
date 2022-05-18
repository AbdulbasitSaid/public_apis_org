import 'package:flutter/material.dart';

class AppDisplayIcon extends StatelessWidget {
  final IconData icon;
  const AppDisplayIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 150,
      color: Colors.white,
      shadows: const [
        BoxShadow(
            spreadRadius: 8,
            color: Color(0xff2C3055),
            blurRadius: 4,
            offset: Offset(2, 4)),
        BoxShadow(
            spreadRadius: 8,
            color: Color(0xff2C3055),
            blurRadius: 4,
            offset: Offset(-2, 4)),
      ],
    );
  }
}
