import 'package:flutter/material.dart';

class My_fab extends StatelessWidget {
  const My_fab({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(
        minHeight: 86,
        maxWidth: 86,
      ),
      shape: CircleBorder(),
      padding: EdgeInsets.all(12),
      fillColor: Colors.red,
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
    );
  }
}
