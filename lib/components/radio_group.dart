import 'package:flutter/material.dart';

class RadioGroup extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final Function(String?) onChanged;
  const RadioGroup(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.label,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: value, groupValue: groupValue, onChanged: onChanged),
        Text(label),
      ],
    );
  }
}
