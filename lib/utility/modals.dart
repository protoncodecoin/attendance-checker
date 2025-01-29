import 'package:flutter/material.dart';

Future<void> bottomLectureModal(BuildContext context) {
  print("I came here");
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    constraints: const BoxConstraints(maxWidth: 480),
    builder: (context) => Container(
      color: Colors.orange,
      height: 400,
    ),
  );
}
