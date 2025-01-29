// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lecture _$LectureFromJson(Map<String, dynamic> json) {
  return _Lecture.fromJson(json);
}

/// @nodoc
mixin _$Lecture {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  dynamic get activeClass => throw _privateConstructorUsedError;
  set activeClass(dynamic value) => throw _privateConstructorUsedError;
  dynamic get hasClassEnded => throw _privateConstructorUsedError;
  set hasClassEnded(dynamic value) => throw _privateConstructorUsedError;
  String get courseTitle => throw _privateConstructorUsedError;
  set courseTitle(String value) => throw _privateConstructorUsedError;
  int get totalStudents => throw _privateConstructorUsedError;
  set totalStudents(int value) => throw _privateConstructorUsedError;
  String get lecturerName => throw _privateConstructorUsedError;
  set lecturerName(String value) => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  set date(String value) => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  set time(String value) => throw _privateConstructorUsedError;
  String get classRoom => throw _privateConstructorUsedError;
  set classRoom(String value) => throw _privateConstructorUsedError;
  String get lecturerId => throw _privateConstructorUsedError;
  set lecturerId(String value) => throw _privateConstructorUsedError;
  List<String> get studentIds => throw _privateConstructorUsedError;
  set studentIds(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this Lecture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LectureCopyWith<Lecture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureCopyWith<$Res> {
  factory $LectureCopyWith(Lecture value, $Res Function(Lecture) then) =
      _$LectureCopyWithImpl<$Res, Lecture>;
  @useResult
  $Res call(
      {String? id,
      dynamic activeClass,
      dynamic hasClassEnded,
      String courseTitle,
      int totalStudents,
      String lecturerName,
      String date,
      String time,
      String classRoom,
      String lecturerId,
      List<String> studentIds});
}

/// @nodoc
class _$LectureCopyWithImpl<$Res, $Val extends Lecture>
    implements $LectureCopyWith<$Res> {
  _$LectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? activeClass = freezed,
    Object? hasClassEnded = freezed,
    Object? courseTitle = null,
    Object? totalStudents = null,
    Object? lecturerName = null,
    Object? date = null,
    Object? time = null,
    Object? classRoom = null,
    Object? lecturerId = null,
    Object? studentIds = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      activeClass: freezed == activeClass
          ? _value.activeClass
          : activeClass // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasClassEnded: freezed == hasClassEnded
          ? _value.hasClassEnded
          : hasClassEnded // ignore: cast_nullable_to_non_nullable
              as dynamic,
      courseTitle: null == courseTitle
          ? _value.courseTitle
          : courseTitle // ignore: cast_nullable_to_non_nullable
              as String,
      totalStudents: null == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int,
      lecturerName: null == lecturerName
          ? _value.lecturerName
          : lecturerName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      classRoom: null == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as String,
      lecturerId: null == lecturerId
          ? _value.lecturerId
          : lecturerId // ignore: cast_nullable_to_non_nullable
              as String,
      studentIds: null == studentIds
          ? _value.studentIds
          : studentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LectureImplCopyWith<$Res> implements $LectureCopyWith<$Res> {
  factory _$$LectureImplCopyWith(
          _$LectureImpl value, $Res Function(_$LectureImpl) then) =
      __$$LectureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      dynamic activeClass,
      dynamic hasClassEnded,
      String courseTitle,
      int totalStudents,
      String lecturerName,
      String date,
      String time,
      String classRoom,
      String lecturerId,
      List<String> studentIds});
}

/// @nodoc
class __$$LectureImplCopyWithImpl<$Res>
    extends _$LectureCopyWithImpl<$Res, _$LectureImpl>
    implements _$$LectureImplCopyWith<$Res> {
  __$$LectureImplCopyWithImpl(
      _$LectureImpl _value, $Res Function(_$LectureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? activeClass = freezed,
    Object? hasClassEnded = freezed,
    Object? courseTitle = null,
    Object? totalStudents = null,
    Object? lecturerName = null,
    Object? date = null,
    Object? time = null,
    Object? classRoom = null,
    Object? lecturerId = null,
    Object? studentIds = null,
  }) {
    return _then(_$LectureImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      activeClass: freezed == activeClass ? _value.activeClass! : activeClass,
      hasClassEnded:
          freezed == hasClassEnded ? _value.hasClassEnded! : hasClassEnded,
      courseTitle: null == courseTitle
          ? _value.courseTitle
          : courseTitle // ignore: cast_nullable_to_non_nullable
              as String,
      totalStudents: null == totalStudents
          ? _value.totalStudents
          : totalStudents // ignore: cast_nullable_to_non_nullable
              as int,
      lecturerName: null == lecturerName
          ? _value.lecturerName
          : lecturerName // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      classRoom: null == classRoom
          ? _value.classRoom
          : classRoom // ignore: cast_nullable_to_non_nullable
              as String,
      lecturerId: null == lecturerId
          ? _value.lecturerId
          : lecturerId // ignore: cast_nullable_to_non_nullable
              as String,
      studentIds: null == studentIds
          ? _value.studentIds
          : studentIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LectureImpl with DiagnosticableTreeMixin implements _Lecture {
  _$LectureImpl(
      {this.id,
      this.activeClass = false,
      this.hasClassEnded = false,
      required this.courseTitle,
      required this.totalStudents,
      required this.lecturerName,
      required this.date,
      required this.time,
      required this.classRoom,
      required this.lecturerId,
      required this.studentIds});

  factory _$LectureImpl.fromJson(Map<String, dynamic> json) =>
      _$$LectureImplFromJson(json);

  @override
  String? id;
  @override
  @JsonKey()
  dynamic activeClass;
  @override
  @JsonKey()
  dynamic hasClassEnded;
  @override
  String courseTitle;
  @override
  int totalStudents;
  @override
  String lecturerName;
  @override
  String date;
  @override
  String time;
  @override
  String classRoom;
  @override
  String lecturerId;
  @override
  List<String> studentIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Lecture(id: $id, activeClass: $activeClass, hasClassEnded: $hasClassEnded, courseTitle: $courseTitle, totalStudents: $totalStudents, lecturerName: $lecturerName, date: $date, time: $time, classRoom: $classRoom, lecturerId: $lecturerId, studentIds: $studentIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Lecture'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('activeClass', activeClass))
      ..add(DiagnosticsProperty('hasClassEnded', hasClassEnded))
      ..add(DiagnosticsProperty('courseTitle', courseTitle))
      ..add(DiagnosticsProperty('totalStudents', totalStudents))
      ..add(DiagnosticsProperty('lecturerName', lecturerName))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('classRoom', classRoom))
      ..add(DiagnosticsProperty('lecturerId', lecturerId))
      ..add(DiagnosticsProperty('studentIds', studentIds));
  }

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureImplCopyWith<_$LectureImpl> get copyWith =>
      __$$LectureImplCopyWithImpl<_$LectureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LectureImplToJson(
      this,
    );
  }
}

abstract class _Lecture implements Lecture {
  factory _Lecture(
      {String? id,
      dynamic activeClass,
      dynamic hasClassEnded,
      required String courseTitle,
      required int totalStudents,
      required String lecturerName,
      required String date,
      required String time,
      required String classRoom,
      required String lecturerId,
      required List<String> studentIds}) = _$LectureImpl;

  factory _Lecture.fromJson(Map<String, dynamic> json) = _$LectureImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  dynamic get activeClass;
  set activeClass(dynamic value);
  @override
  dynamic get hasClassEnded;
  set hasClassEnded(dynamic value);
  @override
  String get courseTitle;
  set courseTitle(String value);
  @override
  int get totalStudents;
  set totalStudents(int value);
  @override
  String get lecturerName;
  set lecturerName(String value);
  @override
  String get date;
  set date(String value);
  @override
  String get time;
  set time(String value);
  @override
  String get classRoom;
  set classRoom(String value);
  @override
  String get lecturerId;
  set lecturerId(String value);
  @override
  List<String> get studentIds;
  set studentIds(List<String> value);

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LectureImplCopyWith<_$LectureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
