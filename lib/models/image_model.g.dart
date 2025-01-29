// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      imageName: json['imageName'] as String,
      studentEmail: json['studentEmail'] as String,
      directoryName: json['directoryName'] as String,
      downloadUrl: json['downloadUrl'] as String,
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'imageName': instance.imageName,
      'studentEmail': instance.studentEmail,
      'directoryName': instance.directoryName,
      'downloadUrl': instance.downloadUrl,
    };
