import 'package:classroom33common/classroom33common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  factory Counter({
    required QuestionResult counter1,
    required QuestionResult counter2,
    required QuestionResult counter3,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'counter1': counter1.toJson(),
        'counter2': counter2.toJson(),
        'counter3': counter3.toJson(),
      };
}
