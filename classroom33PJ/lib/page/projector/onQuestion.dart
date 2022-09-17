import 'package:audioplayers/audioplayers.dart';
import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 問題表示部分
class OnRunningPage extends HookConsumerWidget {
  const OnRunningPage({required this.stateItem, super.key});
  final StateItem stateItem;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 初回描画のみ実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(onQuestionTimerProvdier).whenData((value) {
        if (value == OnQuestionTimerState.question1 ||
            value == OnQuestionTimerState.question2 ||
            value == OnQuestionTimerState.question3) {
          AudioPlayer().play(AssetSource('start.wav'));
        } else if (value == OnQuestionTimerState.wait2 ||
            value == OnQuestionTimerState.wait3) {
          AudioPlayer().play(AssetSource('end.wav'));
        }
      });
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: stateItem.position.onPrimary
                .map((e) => e.withOpacity(1))
                .toList(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            color: Colors.white.withOpacity(0.85),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: ref.watch(onQuestionTimerProvdier).when<Widget>(
                  error: (error, stack) => Center(
                    child: Text(error.toString()),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  data: (data) {
                    if (stateItem.bigQuestionGroupId == null) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: FittedBox(
                            child: Text(
                              'ユーザ登録がされていません',
                              style: TextStyle(fontSize: 100),
                            ),
                          ),
                        ),
                      );
                    }
                    final question = ref
                        .watch(questionProvider)
                        .firstWhere(
                          (e) => e.id == stateItem.bigQuestionGroupId,
                        )
                        .questions[stateItem.position.index];

                    return Stack(
                      children: [
                        Column(),
                        Row(),
                        if (data == OnQuestionTimerState.question1)
                          SmallQuestionWidget(question.questions[0], data),
                        if (data == OnQuestionTimerState.question2)
                          SmallQuestionWidget(question.questions[1], data),
                        if (data == OnQuestionTimerState.question3)
                          SmallQuestionWidget(question.questions[2], data),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                data.title,
                                style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
          ),
        ),
      ),
    );
  }
}

class SmallQuestionWidget extends StatefulHookConsumerWidget {
  const SmallQuestionWidget(this.item, this.state, {super.key});
  final SmallQuestionItem item;
  final OnQuestionTimerState state;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SmallQuestionWidgetState();
}

class _SmallQuestionWidgetState extends ConsumerState<SmallQuestionWidget> {
  double questionTextOpacity = 0;
  late SmallQuestionItem item;
  late OnQuestionTimerState state;

  @override
  void initState() {
    super.initState();
    item = widget.item;
    state = widget.state;
    questionTextOpacity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(),
        // 問題
        Padding(
          padding: const EdgeInsets.all(24),
          child: FittedBox(
            child: Row(
              children: [
                AnimatedOpacity(
                  opacity: questionTextOpacity,
                  duration: const Duration(milliseconds: 1000),
                  child: Math.tex(
                    item.questionStatement,
                    mathStyle: (item.id == 11)
                        ? MathStyle.displayCramped
                        : MathStyle.displayCramped,
                    textStyle: const TextStyle(
                      fontFamily: 'UDDigiKyokashoN-R',
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                    ),
                    onErrorFallback: (err) => Container(
                      color: const Color.fromARGB(255, 144, 10, 0),
                      child: Text(
                        'エラーが発生しました${err.messageWithType}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 230, 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // 選択肢
        Column(
          children: [
            // 1,2
            Row(
              children: [
                const SizedBox(width: 20),
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        backgroundColor: 1.correctAnswerColor,
                        child: const Text(
                          '1',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[0],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        backgroundColor: 2.correctAnswerColor,
                        child: const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[1],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            // 3,4
            Row(
              children: [
                const SizedBox(width: 20),
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        backgroundColor: 3.correctAnswerColor,
                        child: const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[2],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        backgroundColor: 4.correctAnswerColor,
                        child: const Text(
                          '4',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: FittedBox(
                            child: Math.tex(
                              item.choices[3],
                              textStyle: const TextStyle(fontSize: 80),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedProgressBar(
            duration: state.duration,
            showPercent: false,
          ),
        ),
      ],
    );
  }
}

/// ProgressBarのAnimation
/// [duration] は、アニメーションの時間(ms)
/// [showPercent] パーセンテージを表示するか
class AnimatedProgressBar extends StatefulHookConsumerWidget {
  const AnimatedProgressBar({
    this.showPercent = true,
    required this.duration,
    super.key,
  });

  /// 待機時間(ms)
  final int duration;

  /// パーセンテージを表示するか
  final bool showPercent;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends ConsumerState<AnimatedProgressBar> {
  @override
  Widget build(BuildContext context) {
    final duration = widget.duration;
    final showPercent = widget.showPercent;

    final controller = useAnimationController(
      duration: Duration(milliseconds: duration),
    );

    final animatable = Tween<double>(
      begin: 0,
      end: 1,
    ).chain(CurveTween(curve: Curves.linear));

    final animation = animatable.animate(controller);

    // 描画されたらAnimation開始
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.forward();
    });

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        if (showPercent) {
          return Row(
            children: [
              Text('${(animation.value * 100).toStringAsFixed(0)}%'),
              LinearProgressIndicator(
                value: animation.value,
                minHeight: 8,
              )
            ],
          );
        }
        return LinearProgressIndicator(
          value: animation.value,
        );
      },
    );
  }
}
