import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard(
      {super.key,
      required this.firstLeadingText,
      required this.lastLeadingText});

  final String firstLeadingText;
  final String lastLeadingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text(firstLeadingText),
          ),
        ),
        Expanded(
          child: ListTile(
            leading: Icon(Icons.alarm),
            title: Text(lastLeadingText),
          ),
        ),
      ],
    );
  }
}
