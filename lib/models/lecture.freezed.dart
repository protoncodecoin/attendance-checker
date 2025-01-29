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
  bool? get activeClass => throw _privateConstructorUsedError;
  set activeClass(bool? value) => throw _privateConstructorUsedError;
  bool? get hasClassEnded => throw _privateConstructorUsedError;
  set hasClassEnded(bool? value) => throw _privateConstructorUsedError;
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
  Lecturer get lecturer => throw _privateConstructorUsedError;
  set lecturer(Lecturer value) => throw _privateConstructorUsedError;
  List<Student> get students => throw _privateConstructorUsedError;
  set students(List<Student> value) => throw _privateConstructorUsedError;

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
      bool? activeClass,
      bool? hasClassEnded,
      String courseTitle,
      int totalStudents,
      String lecturerName,
      String date,
      String time,
      String classRoom,
      Lecturer lecturer,
      List<Student> students});

  $LecturerCopyWith<$Res> get lecturer;
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
    Object? lecturer = null,
    Object? students = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      activeClass: freezed == activeClass
          ? _value.activeClass
          : activeClass // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasClassEnded: freezed == hasClassEnded
          ? _value.hasClassEnded
          : hasClassEnded // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as Lecturer,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
    ) as $Val);
  }

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LecturerCopyWith<$Res> get lecturer {
    return $LecturerCopyWith<$Res>(_value.lecturer, (value) {
      return _then(_value.copyWith(lecturer: value) as $Val);
    });
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
      bool? activeClass,
      bool? hasClassEnded,
      String courseTitle,
      int totalStudents,
      String lecturerName,
      String date,
      String time,
      String classRoom,
      Lecturer lecturer,
      List<Student> students});

  @override
  $LecturerCopyWith<$Res> get lecturer;
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
    Object? lecturer = null,
    Object? students = null,
  }) {
    return _then(_$LectureImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      activeClass: freezed == activeClass
          ? _value.activeClass
          : activeClass // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasClassEnded: freezed == hasClassEnded
          ? _value.hasClassEnded
          : hasClassEnded // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as Lecturer,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LectureImpl with DiagnosticableTreeMixin implements _Lecture {
  _$LectureImpl(
      {this.id,
      this.activeClass,
      this.hasClassEnded,
      required this.courseTitle,
      required this.totalStudents,
      required this.lecturerName,
      required this.date,
      required this.time,
      required this.classRoom,
      required this.lecturer,
      required this.students});

  factory _$LectureImpl.fromJson(Map<String, dynamic> json) =>
      _$$LectureImplFromJson(json);

  @override
  String? id;
  @override
  bool? activeClass;
  @override
  bool? hasClassEnded;
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
  Lecturer lecturer;
  @override
  List<Student> students;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Lecture(id: $id, activeClass: $activeClass, hasClassEnded: $hasClassEnded, courseTitle: $courseTitle, totalStudents: $totalStudents, lecturerName: $lecturerName, date: $date, time: $time, classRoom: $classRoom, lecturer: $lecturer, students: $students)';
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
      ..add(DiagnosticsProperty('lecturer', lecturer))
      ..add(DiagnosticsProperty('students', students));
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
      bool? activeClass,
      bool? hasClassEnded,
      required String courseTitle,
      required int totalStudents,
      required String lecturerName,
      required String date,
      required String time,
      required String classRoom,
      required Lecturer lecturer,
      required List<Student> students}) = _$LectureImpl;

  factory _Lecture.fromJson(Map<String, dynamic> json) = _$LectureImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  bool? get activeClass;
  set activeClass(bool? value);
  @override
  bool? get hasClassEnded;
  set hasClassEnded(bool? value);
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
  Lecturer get lecturer;
  set lecturer(Lecturer value);
  @override
  List<Student> get students;
  set students(List<Student> value);

  /// Create a copy of Lecture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LectureImplCopyWith<_$LectureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
