// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LectureImpl _$$LectureImplFromJson(Map<String, dynamic> json) =>
    _$LectureImpl(
      id: json['id'] as String?,
      activeClass: json['activeClass'] as bool?,
      hasClassEnded: json['hasClassEnded'] as bool?,
      courseTitle: json['courseTitle'] as String,
      totalStudents: (json['totalStudents'] as num).toInt(),
      lecturerName: json['lecturerName'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      classRoom: json['classRoom'] as String,
      lecturer: Lecturer.fromJson(json['lecturer'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>)
          .map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LectureImplToJson(_$LectureImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'activeClass': instance.activeClass,
      'hasClassEnded': instance.hasClassEnded,
      'courseTitle': instance.courseTitle,
      'totalStudents': instance.totalStudents,
      'lecturerName': instance.lecturerName,
      'date': instance.date,
      'time': instance.time,
      'classRoom': instance.classRoom,
      'lecturer': instance.lecturer,
      'students': instance.students,
    };
