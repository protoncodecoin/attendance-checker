// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String?,
      fullname: json['fullname'] as String,
      level: json['level'] as String,
      programeOfStudy: json['programeOfStudy'] as String,
      email: json['email'] as String,
      lectureIds: json['lectureIds'] ?? List<String>,
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'level': instance.level,
      'programeOfStudy': instance.programeOfStudy,
      'email': instance.email,
      'lectureIds': instance.lectureIds,
    };
