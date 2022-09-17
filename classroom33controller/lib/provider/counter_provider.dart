import 'package:classroom33common/classroom33common.dart';
import 'package:controller/model/counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier()
      : super(
          Counter(
            counter1: QuestionResult(correctCount: 0, wrongCount: 0),
            counter2: QuestionResult(correctCount: 0, wrongCount: 0),
            counter3: QuestionResult(correctCount: 0, wrongCount: 0),
          ),
        );

  void reset() {
    state = state.copyWith(
      counter1: QuestionResult(correctCount: 0, wrongCount: 0),
      counter2: QuestionResult(correctCount: 0, wrongCount: 0),
      counter3: QuestionResult(correctCount: 0, wrongCount: 0),
    );
  }

  /// 配列出力
  List<QuestionResult> get items => [
        state.counter1,
        state.counter2,
        state.counter3,
      ];

  /// 数を増やす
  /// [questionNumber] 1~3
  /// [isCorrect] 正解ならtrue
  /// [isWrong] 誤答ならtrue
  void add({
    required int questionNumber,
    required bool isCorrect,
    required bool isWrong,
  }) {
    if (questionNumber == 1) {
      state = state.copyWith(
        counter1: QuestionResult(
          correctCount: isCorrect
              ? state.counter1.correctCount + 1
              : state.counter1.correctCount,
          wrongCount: isWrong
              ? state.counter1.wrongCount + 1
              : state.counter1.wrongCount,
        ),
      );
    } else if (questionNumber == 2) {
      state = state.copyWith(
        counter2: QuestionResult(
          correctCount: isCorrect
              ? state.counter2.correctCount + 1
              : state.counter2.correctCount,
          wrongCount: isWrong
              ? state.counter2.wrongCount + 1
              : state.counter2.wrongCount,
        ),
      );
    } else if (questionNumber == 3) {
      state = state.copyWith(
        counter3: QuestionResult(
          correctCount: isCorrect
              ? state.counter3.correctCount + 1
              : state.counter3.correctCount,
          wrongCount: isWrong
              ? state.counter3.wrongCount + 1
              : state.counter3.wrongCount,
        ),
      );
    }
  }

  /// 数を減らす
  /// [questionNumber] 1~3
  /// [isCorrect] 正解ならtrue
  /// [isWrong] 誤答ならtrue
  void subtract({
    required int questionNumber,
    required bool isCorrect,
    required bool isWrong,
  }) {
    if (questionNumber == 1) {
      state = state.copyWith(
        counter1: QuestionResult(
          correctCount: isCorrect
              ? state.counter1.correctCount - 1
              : state.counter1.correctCount,
          wrongCount: isWrong
              ? state.counter1.wrongCount - 1
              : state.counter1.wrongCount,
        ),
      );
    } else if (questionNumber == 2) {
      state = state.copyWith(
        counter2: QuestionResult(
          correctCount: isCorrect
              ? state.counter2.correctCount - 1
              : state.counter2.correctCount,
          wrongCount: isWrong
              ? state.counter2.wrongCount - 1
              : state.counter2.wrongCount,
        ),
      );
    } else if (questionNumber == 3) {
      state = state.copyWith(
        counter3: QuestionResult(
          correctCount: isCorrect
              ? state.counter3.correctCount - 1
              : state.counter3.correctCount,
          wrongCount: isWrong
              ? state.counter3.wrongCount - 1
              : state.counter3.wrongCount,
        ),
      );
    }
  }

  /// 数を変更する
  /// [questionNumber] 1~3
  /// [correctCount] 正解数
  /// [wrongCount] 誤答数
  void change({
    required int questionNumber,
    int? correctCount,
    int? wrongCount,
  }) {
    if (questionNumber == 1) {
      state = state.copyWith(
        counter1: QuestionResult(
          correctCount: correctCount ?? state.counter1.correctCount,
          wrongCount: wrongCount ?? state.counter1.wrongCount,
        ),
      );
    } else if (questionNumber == 2) {
      state = state.copyWith(
        counter2: QuestionResult(
          correctCount: correctCount ?? state.counter2.correctCount,
          wrongCount: wrongCount ?? state.counter2.wrongCount,
        ),
      );
    } else if (questionNumber == 3) {
      state = state.copyWith(
        counter3: QuestionResult(
          correctCount: correctCount ?? state.counter3.correctCount,
          wrongCount: wrongCount ?? state.counter3.wrongCount,
        ),
      );
    }
  }
}
