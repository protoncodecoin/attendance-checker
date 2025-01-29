// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecturer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lecturer _$LecturerFromJson(Map<String, dynamic> json) {
  return _Lecturer.fromJson(json);
}

/// @nodoc
mixin _$Lecturer {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  set fullname(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;

  /// Serializes this Lecturer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lecturer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LecturerCopyWith<Lecturer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LecturerCopyWith<$Res> {
  factory $LecturerCopyWith(Lecturer value, $Res Function(Lecturer) then) =
      _$LecturerCopyWithImpl<$Res, Lecturer>;
  @useResult
  $Res call({String? id, String fullname, String email});
}

/// @nodoc
class _$LecturerCopyWithImpl<$Res, $Val extends Lecturer>
    implements $LecturerCopyWith<$Res> {
  _$LecturerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lecturer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = null,
    Object? email = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LecturerImplCopyWith<$Res>
    implements $LecturerCopyWith<$Res> {
  factory _$$LecturerImplCopyWith(
          _$LecturerImpl value, $Res Function(_$LecturerImpl) then) =
      __$$LecturerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String fullname, String email});
}

/// @nodoc
class __$$LecturerImplCopyWithImpl<$Res>
    extends _$LecturerCopyWithImpl<$Res, _$LecturerImpl>
    implements _$$LecturerImplCopyWith<$Res> {
  __$$LecturerImplCopyWithImpl(
      _$LecturerImpl _value, $Res Function(_$LecturerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Lecturer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullname = null,
    Object? email = null,
  }) {
    return _then(_$LecturerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LecturerImpl with DiagnosticableTreeMixin implements _Lecturer {
  _$LecturerImpl({this.id, required this.fullname, required this.email});

  factory _$LecturerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LecturerImplFromJson(json);

  @override
  String? id;
  @override
  String fullname;
  @override
  String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Lecturer(id: $id, fullname: $fullname, email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Lecturer'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fullname', fullname))
      ..add(DiagnosticsProperty('email', email));
  }

  /// Create a copy of Lecturer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LecturerImplCopyWith<_$LecturerImpl> get copyWith =>
      __$$LecturerImplCopyWithImpl<_$LecturerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LecturerImplToJson(
      this,
    );
  }
}

abstract class _Lecturer implements Lecturer {
  factory _Lecturer(
      {String? id,
      required String fullname,
      required String email}) = _$LecturerImpl;

  factory _Lecturer.fromJson(Map<String, dynamic> json) =
      _$LecturerImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String get fullname;
  set fullname(String value);
  @override
  String get email;
  set email(String value);

  /// Create a copy of Lecturer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LecturerImplCopyWith<_$LecturerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
