import 'package:flutter/material.dart';
import '../constants.dart';

class OptionCard extends StatelessWidget {
  Color? color;
  final String option;
  final VoidCallback onTap;
  OptionCard(
      {super.key,
      required this.option,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
