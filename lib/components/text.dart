import 'package:flutter/material.dart';

class ShowLabel extends StatelessWidget {
  const ShowLabel({
    super.key,
    required this.startLabel,
    required this.endLabel,
    required this.paddingLeft,
  });

  final String startLabel;
  final String endLabel;
  final double paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          startLabel,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(left: paddingLeft),
          child: Text(
            endLabel,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
