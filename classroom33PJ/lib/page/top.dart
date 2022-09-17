import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projector/page/projector/onQuestion.dart';
import 'package:projector/page/projector/on_user_choice.dart';
import 'package:projector/page/projector/on_waiting_for_admin.dart';

class StateDistributorPage extends HookConsumerWidget {
  const StateDistributorPage({required this.position, super.key});
  final DevicePosition position;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(stateItemStreamProvider(position)).when(
          data: (data) =>
              (data.bigQuestionState == BigQuestionState.waitingForController)
                  ? OnUserChoicePage(stateItem: data)
                  : (data.bigQuestionState == BigQuestionState.running)
                      ? OnRunningPage(
                          stateItem: data
                        )
                      : OnWaitingForAdminPage(stateItem: data),
          loading: () => Scaffold(
            appBar: AppBar(
              title: const Text('データベースに接続中'),
            ),
            body: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
          error: (error, stack) => Scaffold(
            appBar: AppBar(
              title: const Text('DeviceStateの解析中に例外発生'),
            ),
            body: Center(
              child: Text(error.toString()),
            ),
          ),
        );
  }
}
