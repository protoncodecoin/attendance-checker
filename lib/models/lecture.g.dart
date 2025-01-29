// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LectureImpl _$$LectureImplFromJson(Map<String, dynamic> json) =>
    _$LectureImpl(
      id: json['id'] as String?,
      activeClass: json['activeClass'] ?? false,
      hasClassEnded: json['hasClassEnded'] ?? false,
      courseTitle: json['courseTitle'] as String,
      totalStudents: (json['totalStudents'] as num).toInt(),
      lecturerName: json['lecturerName'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      classRoom: json['classRoom'] as String,
      lecturerId: json['lecturerId'] as String,
      studentIds: (json['studentIds'] as List<dynamic>)
          .map((e) => e as String)
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
      'lecturerId': instance.lecturerId,
      'studentIds': instance.studentIds,
    };
