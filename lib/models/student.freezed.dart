// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  set fullname(String value) => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  set level(String value) => throw _privateConstructorUsedError;
  String get programeOfStudy => throw _privateConstructorUsedError;
  set programeOfStudy(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  dynamic get lectureIds => throw _privateConstructorUsedError;
  set lectureIds(dynamic value) => throw _privateConstructorUsedError;

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {String? id,
      String fullname,
      String level,
      String programeOfStudy,
      String email,
      dynamic lectureIds});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = null,
    Object? level = null,
    Object? programeOfStudy = null,
    Object? email = null,
    Object? lectureIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      programeOfStudy: null == programeOfStudy
          ? _value.programeOfStudy
          : programeOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lectureIds: freezed == lectureIds
          ? _value.lectureIds
          : lectureIds // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentImplCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$StudentImplCopyWith(
          _$StudentImpl value, $Res Function(_$StudentImpl) then) =
      __$$StudentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String fullname,
      String level,
      String programeOfStudy,
      String email,
      dynamic lectureIds});
}

/// @nodoc
class __$$StudentImplCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$StudentImpl>
    implements _$$StudentImplCopyWith<$Res> {
  __$$StudentImplCopyWithImpl(
      _$StudentImpl _value, $Res Function(_$StudentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = null,
    Object? level = null,
    Object? programeOfStudy = null,
    Object? email = null,
    Object? lectureIds = freezed,
  }) {
    return _then(_$StudentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      programeOfStudy: null == programeOfStudy
          ? _value.programeOfStudy
          : programeOfStudy // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      lectureIds: freezed == lectureIds ? _value.lectureIds! : lectureIds,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentImpl with DiagnosticableTreeMixin implements _Student {
  _$StudentImpl(
      {this.id,
      required this.fullname,
      required this.level,
      required this.programeOfStudy,
      required this.email,
      this.lectureIds = List<String>});

  factory _$StudentImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentImplFromJson(json);

  @override
  String? id;
  @override
  String fullname;
  @override
  String level;
  @override
  String programeOfStudy;
  @override
  String email;
  @override
  @JsonKey()
  dynamic lectureIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Student(id: $id, fullname: $fullname, level: $level, programeOfStudy: $programeOfStudy, email: $email, lectureIds: $lectureIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Student'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fullname', fullname))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('programeOfStudy', programeOfStudy))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('lectureIds', lectureIds));
  }

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      __$$StudentImplCopyWithImpl<_$StudentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentImplToJson(
      this,
    );
  }
}

abstract class _Student implements Student {
  factory _Student(
      {String? id,
      required String fullname,
      required String level,
      required String programeOfStudy,
      required String email,
      dynamic lectureIds}) = _$StudentImpl;

  factory _Student.fromJson(Map<String, dynamic> json) = _$StudentImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String get fullname;
  set fullname(String value);
  @override
  String get level;
  set level(String value);
  @override
  String get programeOfStudy;
  set programeOfStudy(String value);
  @override
  String get email;
  set email(String value);
  @override
  dynamic get lectureIds;
  set lectureIds(dynamic value);

  /// Create a copy of Student
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentImplCopyWith<_$StudentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
