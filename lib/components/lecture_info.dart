import 'package:flutter/material.dart';
import 'package:attendance_system/components/bottom_card.dart';
import 'package:attendance_system/components/lecture_info_chip.dart';
import 'package:attendance_system/components/text.dart';
import 'package:attendance_system/models/lecture.dart';
import 'package:attendance_system/screens/scan.dart';

class LectureInfoCard extends StatelessWidget {
  final Lecture lecture;
  final Color selectedColor;

  const LectureInfoCard({
    super.key,
    this.selectedColor = Colors.blue,
    required this.lecture,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          lectureBottomModal(context, lecture.hasClassEnded!),
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 10),
              child: Text(
                lecture.courseTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: selectedColor,
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 1,
              height: 1,
              color: selectedColor,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    VerticalDivider(
                      width: 25,
                      thickness: 5,
                      indent: 10,
                      endIndent: 10,
                      color: selectedColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowLabel(
                          startLabel: "Student",
                          endLabel: lecture.totalStudents.toString(),
                          paddingLeft: 30,
                        ),
                        ShowLabel(
                          startLabel: "Lecturer",
                          endLabel: lecture.lecturerName,
                          paddingLeft: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BottomCard(
                firstLeadingText: lecture.date, lastLeadingText: lecture.time)
          ],
        ),
      ),
    );
  }

  Future<void> lectureBottomModal(BuildContext context, bool hasClassEnded) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      constraints: const BoxConstraints(maxWidth: 480),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => lecture.hasClassEnded!
          ? _buildLectureEnded(context)
          : _buildOngoingLecture(context),
    );
  }

  Widget _buildLectureEnded(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Lecture Has Ended",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          LectureInfoChip(leadingText: "Student No.", trailingText: "50"),
          LectureInfoChip(leadingText: "Attended No.", trailingText: "40"),
        ],
      ),
    );
  }

  Widget _buildOngoingLecture(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Course Detail"),
          const SizedBox(height: 30),
          // Wrap(
          //   spacing: 30,
          //   children: [
          //     Text(
          //       "Course Code",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w600, fontSize: 20),
          //     ),
          //     Text(
          //       "cs550",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w500, fontSize: 17),
          //     ),
          //   ],
          // ),
          // Divider(),
          BottomSheetLabel(
              leading: "Course Code", trailing: lecture.courseTitle),
          Divider(),
          BottomSheetLabel(leading: "Lecturer", trailing: lecture.lecturerName),
          Divider(),
          BottomSheetLabel(leading: "Class Room", trailing: lecture.classRoom),
          const SizedBox(
            height: 10,
          ),
          BottomSheetButton(
            label: "Sign in",
          )
        ],
      ),
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  final String label;
  const BottomSheetButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ScanScreen(),
              ),
            );
          },
          child: Text(label),
        )
      ],
    );
  }
}

class BottomSheetLabel extends StatelessWidget {
  final String leading;
  final String trailing;

  const BottomSheetLabel({
    super.key,
    required this.leading,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              overflow: TextOverflow.ellipsis),
        ),
        Text(
          trailing,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
      ],
    );
  }
}
