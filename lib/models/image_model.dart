import "package:flutter/foundation.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  factory ImageModel({
    required String imageName,
    required String studentEmail,
    required String directoryName,
    required String downloadUrl,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

ImageModel imageInstance = ImageModel(
    imageName: "Example Image",
    studentEmail: "placehoder@gmail.com",
    directoryName: "studentImage",
    downloadUrl: "https://iwerwe.png");
