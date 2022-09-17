import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final onQuestionTimerProvdier = StreamProvider.autoDispose(
  (ref) async* {
    for (final state in OnQuestionTimerState.values) {
      yield state;
      log(state.toString(), name: 'onQuestionTimerProvdier');
      await Future<void>.delayed(Duration(milliseconds: state.duration));
    }
    // TODO(YumNumm): 終了処理
  },
);

// TODO(YumNumm): パラメータの調節
enum OnQuestionTimerState {
  wait1(0, '開始待機中...'),
  question1(17500, '小問1'),
  wait2(5000, '小問2待機'),
  question2(17500, '小問2'),
  wait3(5000, '小問3待機'),
  question3(17500, '小問3'),
  end(0, '次に進んでください');

  const OnQuestionTimerState(this.duration, this.title);

  /// 待機時間(ms)
  final int duration;

  /// タイトル
  final String title;
}
