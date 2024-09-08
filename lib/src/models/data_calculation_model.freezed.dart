// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_calculation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DataCalculationModel {
  String? get result => throw _privateConstructorUsedError;
  String? get input => throw _privateConstructorUsedError;
  List<int>? get imagePath => throw _privateConstructorUsedError;

  /// Create a copy of DataCalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCalculationModelCopyWith<DataCalculationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCalculationModelCopyWith<$Res> {
  factory $DataCalculationModelCopyWith(DataCalculationModel value,
          $Res Function(DataCalculationModel) then) =
      _$DataCalculationModelCopyWithImpl<$Res, DataCalculationModel>;
  @useResult
  $Res call({String? result, String? input, List<int>? imagePath});
}

/// @nodoc
class _$DataCalculationModelCopyWithImpl<$Res,
        $Val extends DataCalculationModel>
    implements $DataCalculationModelCopyWith<$Res> {
  _$DataCalculationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataCalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? input = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataCalculationModelImplCopyWith<$Res>
    implements $DataCalculationModelCopyWith<$Res> {
  factory _$$DataCalculationModelImplCopyWith(_$DataCalculationModelImpl value,
          $Res Function(_$DataCalculationModelImpl) then) =
      __$$DataCalculationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? result, String? input, List<int>? imagePath});
}

/// @nodoc
class __$$DataCalculationModelImplCopyWithImpl<$Res>
    extends _$DataCalculationModelCopyWithImpl<$Res, _$DataCalculationModelImpl>
    implements _$$DataCalculationModelImplCopyWith<$Res> {
  __$$DataCalculationModelImplCopyWithImpl(_$DataCalculationModelImpl _value,
      $Res Function(_$DataCalculationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataCalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? input = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_$DataCalculationModelImpl(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String?,
      input: freezed == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value._imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$DataCalculationModelImpl implements _DataCalculationModel {
  const _$DataCalculationModelImpl(
      {this.result, this.input, final List<int>? imagePath})
      : _imagePath = imagePath;

  @override
  final String? result;
  @override
  final String? input;
  final List<int>? _imagePath;
  @override
  List<int>? get imagePath {
    final value = _imagePath;
    if (value == null) return null;
    if (_imagePath is EqualUnmodifiableListView) return _imagePath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataCalculationModel(result: $result, input: $input, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataCalculationModelImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.input, input) || other.input == input) &&
            const DeepCollectionEquality()
                .equals(other._imagePath, _imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, input,
      const DeepCollectionEquality().hash(_imagePath));

  /// Create a copy of DataCalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCalculationModelImplCopyWith<_$DataCalculationModelImpl>
      get copyWith =>
          __$$DataCalculationModelImplCopyWithImpl<_$DataCalculationModelImpl>(
              this, _$identity);
}

abstract class _DataCalculationModel implements DataCalculationModel {
  const factory _DataCalculationModel(
      {final String? result,
      final String? input,
      final List<int>? imagePath}) = _$DataCalculationModelImpl;

  @override
  String? get result;
  @override
  String? get input;
  @override
  List<int>? get imagePath;

  /// Create a copy of DataCalculationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataCalculationModelImplCopyWith<_$DataCalculationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}