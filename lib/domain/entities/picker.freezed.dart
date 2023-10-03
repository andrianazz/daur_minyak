// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Picker _$PickerFromJson(Map<String, dynamic> json) {
  return _Picker.fromJson(json);
}

/// @nodoc
mixin _$Picker {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get license => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PickerCopyWith<Picker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickerCopyWith<$Res> {
  factory $PickerCopyWith(Picker value, $Res Function(Picker) then) =
      _$PickerCopyWithImpl<$Res, Picker>;
  @useResult
  $Res call(
      {int id, String name, String phone, String imageUrl, String license});
}

/// @nodoc
class _$PickerCopyWithImpl<$Res, $Val extends Picker>
    implements $PickerCopyWith<$Res> {
  _$PickerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? imageUrl = null,
    Object? license = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickerImplCopyWith<$Res> implements $PickerCopyWith<$Res> {
  factory _$$PickerImplCopyWith(
          _$PickerImpl value, $Res Function(_$PickerImpl) then) =
      __$$PickerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String phone, String imageUrl, String license});
}

/// @nodoc
class __$$PickerImplCopyWithImpl<$Res>
    extends _$PickerCopyWithImpl<$Res, _$PickerImpl>
    implements _$$PickerImplCopyWith<$Res> {
  __$$PickerImplCopyWithImpl(
      _$PickerImpl _value, $Res Function(_$PickerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? imageUrl = null,
    Object? license = null,
  }) {
    return _then(_$PickerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickerImpl implements _Picker {
  const _$PickerImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.imageUrl,
      required this.license});

  factory _$PickerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String imageUrl;
  @override
  final String license;

  @override
  String toString() {
    return 'Picker(id: $id, name: $name, phone: $phone, imageUrl: $imageUrl, license: $license)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phone, imageUrl, license);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickerImplCopyWith<_$PickerImpl> get copyWith =>
      __$$PickerImplCopyWithImpl<_$PickerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickerImplToJson(
      this,
    );
  }
}

abstract class _Picker implements Picker {
  const factory _Picker(
      {required final int id,
      required final String name,
      required final String phone,
      required final String imageUrl,
      required final String license}) = _$PickerImpl;

  factory _Picker.fromJson(Map<String, dynamic> json) = _$PickerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get imageUrl;
  @override
  String get license;
  @override
  @JsonKey(ignore: true)
  _$$PickerImplCopyWith<_$PickerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
