// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Counter _$CounterFromJson(Map<String, dynamic> json) {
  return _Counter.fromJson(json);
}

/// @nodoc
mixin _$Counter {
  QuestionResult get counter1 => throw _privateConstructorUsedError;
  QuestionResult get counter2 => throw _privateConstructorUsedError;
  QuestionResult get counter3 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CounterCopyWith<Counter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterCopyWith<$Res> {
  factory $CounterCopyWith(Counter value, $Res Function(Counter) then) =
      _$CounterCopyWithImpl<$Res>;
  $Res call(
      {QuestionResult counter1,
      QuestionResult counter2,
      QuestionResult counter3});
}

/// @nodoc
class _$CounterCopyWithImpl<$Res> implements $CounterCopyWith<$Res> {
  _$CounterCopyWithImpl(this._value, this._then);

  final Counter _value;
  // ignore: unused_field
  final $Res Function(Counter) _then;

  @override
  $Res call({
    Object? counter1 = freezed,
    Object? counter2 = freezed,
    Object? counter3 = freezed,
  }) {
    return _then(_value.copyWith(
      counter1: counter1 == freezed
          ? _value.counter1
          : counter1 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
      counter2: counter2 == freezed
          ? _value.counter2
          : counter2 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
      counter3: counter3 == freezed
          ? _value.counter3
          : counter3 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
    ));
  }
}

/// @nodoc
abstract class _$$_CounterCopyWith<$Res> implements $CounterCopyWith<$Res> {
  factory _$$_CounterCopyWith(
          _$_Counter value, $Res Function(_$_Counter) then) =
      __$$_CounterCopyWithImpl<$Res>;
  @override
  $Res call(
      {QuestionResult counter1,
      QuestionResult counter2,
      QuestionResult counter3});
}

/// @nodoc
class __$$_CounterCopyWithImpl<$Res> extends _$CounterCopyWithImpl<$Res>
    implements _$$_CounterCopyWith<$Res> {
  __$$_CounterCopyWithImpl(_$_Counter _value, $Res Function(_$_Counter) _then)
      : super(_value, (v) => _then(v as _$_Counter));

  @override
  _$_Counter get _value => super._value as _$_Counter;

  @override
  $Res call({
    Object? counter1 = freezed,
    Object? counter2 = freezed,
    Object? counter3 = freezed,
  }) {
    return _then(_$_Counter(
      counter1: counter1 == freezed
          ? _value.counter1
          : counter1 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
      counter2: counter2 == freezed
          ? _value.counter2
          : counter2 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
      counter3: counter3 == freezed
          ? _value.counter3
          : counter3 // ignore: cast_nullable_to_non_nullable
              as QuestionResult,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Counter implements _Counter {
  _$_Counter(
      {required this.counter1, required this.counter2, required this.counter3});

  factory _$_Counter.fromJson(Map<String, dynamic> json) =>
      _$$_CounterFromJson(json);

  @override
  final QuestionResult counter1;
  @override
  final QuestionResult counter2;
  @override
  final QuestionResult counter3;

  @override
  String toString() {
    return 'Counter(counter1: $counter1, counter2: $counter2, counter3: $counter3)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Counter &&
            const DeepCollectionEquality().equals(other.counter1, counter1) &&
            const DeepCollectionEquality().equals(other.counter2, counter2) &&
            const DeepCollectionEquality().equals(other.counter3, counter3));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(counter1),
      const DeepCollectionEquality().hash(counter2),
      const DeepCollectionEquality().hash(counter3));

  @JsonKey(ignore: true)
  @override
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      __$$_CounterCopyWithImpl<_$_Counter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CounterToJson(
      this,
    );
  }
}

abstract class _Counter implements Counter {
  factory _Counter(
      {required final QuestionResult counter1,
      required final QuestionResult counter2,
      required final QuestionResult counter3}) = _$_Counter;

  factory _Counter.fromJson(Map<String, dynamic> json) = _$_Counter.fromJson;

  @override
  QuestionResult get counter1;
  @override
  QuestionResult get counter2;
  @override
  QuestionResult get counter3;
  @override
  @JsonKey(ignore: true)
  _$$_CounterCopyWith<_$_Counter> get copyWith =>
      throw _privateConstructorUsedError;
}
