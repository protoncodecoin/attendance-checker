import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  final String title;
  final String value;

  const CourseInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 243, 207),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
