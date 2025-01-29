import 'package:flutter/material.dart';

class LectureInfoChip extends StatelessWidget {
  final String leadingText;
  final String trailingText;

  const LectureInfoChip({
    super.key,
    required this.leadingText,
    required this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: const Color.fromARGB(255, 104, 104, 104),
            ),
          ),
          Text(
            trailingText,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
