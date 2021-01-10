import 'package:flutter/material.dart';

class MealItemBottomInformation extends StatelessWidget {
  final IconData icon;
  final String caption;

  MealItemBottomInformation({this.icon, this.caption});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 3,
        ),
        Text(caption)
      ],
    );
  }
}
