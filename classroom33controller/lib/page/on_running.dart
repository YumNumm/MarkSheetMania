import 'dart:convert';

import 'package:classroom33common/classroom33common.dart';
import 'package:controller/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnRunningPage extends HookConsumerWidget {
  const OnRunningPage({required this.stateItem, super.key});
  final StateItem stateItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctAnswer = useState<int>(1);

    final timerStream = ref.watch(onQuestionTimerProvdier)
      ..whenData<void>((value) {
        HapticFeedback.vibrate();
        if (stateItem.bigQuestionGroupId == null) {
          return;
        }
        if (value == OnQuestionTimerState.question1) {
          correctAnswer.value = ref
              .read(questionProvider)
              .firstWhere((e) => e.id == stateItem.bigQuestionGroupId)
              .questions[0]
              .questions[0]
              .correctAnswerIndex;
        } else if (value == OnQuestionTimerState.question2) {
          correctAnswer.value = ref
              .read(questionProvider)
              .firstWhere((e) => e.id == stateItem.bigQuestionGroupId)
              .questions[0]
              .questions[1]
              .correctAnswerIndex;
        } else if (value == OnQuestionTimerState.question3) {
          correctAnswer.value = ref
              .read(questionProvider)
              .firstWhere((e) => e.id == stateItem.bigQuestionGroupId)
              .questions[0]
              .questions[2]
              .correctAnswerIndex;
        }
      });

    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('実行中'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: stateItem.position.onPrimary
                  .map((e) => e.withOpacity(0.7))
                  .toList(),
            ),
          ),
        ),
      ),
      body: timerStream.when<Widget>(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stack) => Center(
          child: Text(error.toString()),
        ),
        data: (data) => Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(),
                Center(
                  child: Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: stateItem.position.onPrimary[0],
                    ),
                  ),
                ),
                if (stateItem.bigQuestionGroupId != null &&
                    (data == OnQuestionTimerState.question1 ||
                        data == OnQuestionTimerState.wait2 ||
                        data == OnQuestionTimerState.end))
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: ref
                            .read(questionProvider)
                            .firstWhere(
                              (e) => e.id == stateItem.bigQuestionGroupId,
                            )
                            .questions[stateItem.position.index]
                            .questions[0]
                            .correctAnswerIndex
                            .correctAnswerColor,
                        width: 2,
                      ),
                    ),
                    color: ref
                        .read(questionProvider)
                        .firstWhere(
                          (e) => e.id == stateItem.bigQuestionGroupId,
                        )
                        .questions[stateItem.position.index]
                        .questions[0]
                        .correctAnswerIndex
                        .correctAnswerColor
                        .withOpacity(0.2),
                    elevation: 0,
                    child: Column(
                      children: [
                        Row(),
                        Text(
                          '大問1 (正答は${ref.read(questionProvider).firstWhere(
                                (e) => e.id == stateItem.bigQuestionGroupId,
                              ).questions[stateItem.position.index].questions[0].correctAnswerIndex})',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '正答数: ${counter.counter1.correctCount}\n'
                            '不正解数: ${counter.counter1.wrongCount}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // 正答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector1.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector1.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Divider(),
                        // 誤答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector1.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector1.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (stateItem.bigQuestionGroupId != null &&
                    (data == OnQuestionTimerState.question2 ||
                        data == OnQuestionTimerState.wait3 ||
                        data == OnQuestionTimerState.end))
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: ref
                            .read(questionProvider)
                            .firstWhere(
                              (e) => e.id == stateItem.bigQuestionGroupId,
                            )
                            .questions[stateItem.position.index]
                            .questions[1]
                            .correctAnswerIndex
                            .correctAnswerColor,
                        width: 2,
                      ),
                    ),
                    color: ref
                        .read(questionProvider)
                        .firstWhere(
                          (e) => e.id == stateItem.bigQuestionGroupId,
                        )
                        .questions[stateItem.position.index]
                        .questions[1]
                        .correctAnswerIndex
                        .correctAnswerColor
                        .withOpacity(0.2),
                    elevation: 0,
                    child: Column(
                      children: [
                        Row(),
                        Text(
                          '大問2 (正答は${ref.read(questionProvider).firstWhere(
                                (e) => e.id == stateItem.bigQuestionGroupId,
                              ).questions[stateItem.position.index].questions[1].correctAnswerIndex})',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '正答数: ${counter.counter2.correctCount}\n'
                            '不正解数: ${counter.counter2.wrongCount}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // 正答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector2.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector2.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        // 誤答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector2.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector2.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (stateItem.bigQuestionGroupId != null &&
                    (data == OnQuestionTimerState.question3 ||
                        data == OnQuestionTimerState.end))
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: ref
                            .read(questionProvider)
                            .firstWhere(
                              (e) => e.id == stateItem.bigQuestionGroupId,
                            )
                            .questions[stateItem.position.index]
                            .questions[2]
                            .correctAnswerIndex
                            .correctAnswerColor,
                        width: 2,
                      ),
                    ),
                    color: ref
                        .read(questionProvider)
                        .firstWhere(
                          (e) => e.id == stateItem.bigQuestionGroupId,
                        )
                        .questions[stateItem.position.index]
                        .questions[2]
                        .correctAnswerIndex
                        .correctAnswerColor
                        .withOpacity(0.2),
                    elevation: 0,
                    child: Column(
                      children: [
                        Row(),
                        Text(
                          '大問3 (正答は${ref.read(questionProvider).firstWhere(
                                (e) => e.id == stateItem.bigQuestionGroupId,
                              ).questions[stateItem.position.index].questions[2].correctAnswerIndex})',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '正答数: ${counter.counter3.correctCount}\n'
                            '不正解数: ${counter.counter3.wrongCount}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // 正答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector3.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector3.index + 1,
                                        isCorrect: true,
                                        isWrong: false,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        // 誤答カウント
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .add(
                                        questionNumber:
                                            DevicePosition.projector3.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_plus_1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FloatingActionButton(
                                  onPressed: () async => ref
                                      .read(counterProvider.notifier)
                                      .subtract(
                                        questionNumber:
                                            DevicePosition.projector3.index + 1,
                                        isCorrect: false,
                                        isWrong: true,
                                      ),
                                  elevation: 0,
                                  child: const Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (data == OnQuestionTimerState.end)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        // resultCounterの内容確認
                        await showDialog<void>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('確認'),
                              content: Text(counter.toJson().toString()),
                              actions: [
                                FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  label: const Text('キャンセル'),
                                  icon: const Icon(Icons.cancel),
                                ),
                                FloatingActionButton.extended(
                                  label: const Text(
                                    '送信',
                                  ),
                                  icon: const Icon(Icons.send),
                                  onPressed: () async {
                                    try {
                                      final supabase = Supabase.instance.client;
                                      if (stateItem.userId != null) {
                                        final res = await supabase
                                            .from('users')
                                            .select()
                                            .eq('id', stateItem.userId)
                                            .execute();
                                        if (res.hasError) {
                                          print(res.error!.toJson());
                                          throw Exception(
                                            res.error!.toJson().toString(),
                                          );
                                        }
                                        final user = UserModel.fromJson(
                                          (res.data as List)[0]
                                              as Map<String, dynamic>,
                                        );

                                        final result = QuestionsResult(
                                          items: <QuestionResult>[
                                            ...user.result.items,
                                            ...ref
                                                .read(
                                                  counterProvider.notifier,
                                                )
                                                .items,
                                          ],
                                        );
                                        final res2 = await supabase
                                            .from('users')
                                            .update(<String, dynamic>{
                                              'result': result.toJson(),
                                              if (result.items.length == 9)
                                                'total_point': result.items
                                                    .map((e) => e.toPoint)
                                                    .reduce(
                                                      (value, element) =>
                                                          value + element,
                                                    ),
                                            })
                                            .eq('id', user.id)
                                            .execute();
                                        if (res2.hasError) {
                                          throw Exception(
                                            res2.error!.toJson().toString(),
                                          );
                                        }
                                      }
                                      final res3 = await supabase
                                          .from('state')
                                          .update(<String, dynamic>{
                                            'big_question_group_id': null,
                                            'big_question_state':
                                                BigQuestionState
                                                    .waitingForController.name,
                                            'user_id': null,
                                          })
                                          .eq(
                                            'position',
                                            stateItem.position.name,
                                          )
                                          .execute();

                                      // リセット
                                      ref
                                          .read(counterProvider.notifier)
                                          .reset();
                                      Navigator.of(context).pop();
                                      // snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('保存しました'),
                                        ),
                                      );
                                    } catch (e) {
                                      print(e);
                                      Navigator.of(context).pop();
                                      // snackbar
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('エラー発生\n$e'),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      label: const Text('確認'),
                      icon: const Icon(Icons.check),
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  const JsonEncoder.withIndent('  ').convert(
                    stateItem.toJson(),
                  ),
                ),
                if (stateItem.bigQuestionGroupId != null)
                  Text(
                    const JsonEncoder.withIndent('  ').convert(
                      ref
                          .read(questionProvider)
                          .firstWhere(
                            (e) => e.id == stateItem.bigQuestionGroupId,
                          )
                          .questions[stateItem.position.index]
                          .questions,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
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
              const SizedBox(width: 10),
              Expanded(
                child: LinearProgressIndicator(
                  value: animation.value,
                  minHeight: 8,
                ),
              ),
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
