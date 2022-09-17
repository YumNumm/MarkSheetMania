import 'package:admin/provider/average_provider.dart';
import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUser = useState<UserModel?>(null);
    return Row(
      children: [
        // 全体の順位表
        Expanded(
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: ref.watch(topUsersFutureProvider).when<Widget>(
                  error: (error, stackTrace) => Text(
                    error.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (data) {
                    return Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 8,
                          child: ListTile(
                            title: ref
                                .watch(averagePointFutureProvider)
                                .when<Widget>(
                                  loading: CircularProgressIndicator.adaptive,
                                  error: (error, stackTrace) => Text(
                                    error.toString(),
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  data: (data) => Text(
                                    '${data.toStringAsFixed(1)}点',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  '平均点',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                VerticalDivider(),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final e = data[index];
                            return Card(
                              elevation: (e.id == selectedUser.value?.id)
                                  ? 10
                                  : null, //a 選択されているユーザーのカードを強調
                              // テーマから色を取得
                              color: (e.id == selectedUser.value?.id)
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                  : null,
                              child: ListTile(
                                title: Text(
                                  '${e.totalPoint}点',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),

                                // subtitle: Text(
                                //   DateFormat('yyyy/MM/dd hh:mm頃')
                                //       .format(e.createdAt.toLocal()),
                                //   style: const TextStyle(
                                //     fontSize: 20,
                                //   ),
                                // ),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '第${index + 1}位',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      ref
                                          .watch(questionProvider)
                                          .firstWhere(
                                            (element) =>
                                                element.id ==
                                                e.bigQuestionGroupId,
                                          )
                                          .category
                                          .imagePath,
                                    ),
                                    const VerticalDivider(),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
          ),
        ),
        const VerticalDivider(),
        // ユーザの得点表
        Expanded(
          flex: 2,
          child: Column(
            children: [
              ref.watch(usersFutureProvider).when<Widget>(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Text(
                      error.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    data: (data) {
                      try {
                        return InkWell(
                          onTap: () async => showDialog<void>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('ユーザを選択'),
                                content: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      final e = data[index];
                                      return ListTile(
                                        title: Text(e.id.toString()),
                                        onTap: () {
                                          selectedUser.value = e;
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          child: (selectedUser.value == null)
                              ? const FittedBox(
                                  child: Icon(
                                    Icons.person,
                                    size: 100,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // 大問1
                                    BigQuestionResult1(
                                      selectedUser: selectedUser,
                                    ),

                                    // 大問2
                                    BigQuestionResult2(
                                      selectedUser: selectedUser,
                                    ),

                                    // 大問3
                                    BigQuestionResult3(
                                      selectedUser: selectedUser,
                                    ),

                                    // 総合得点
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: BigQuestionResult(
                                        selectedUser: selectedUser,
                                      ),
                                    ),
                                  ],
                                ),
                        );
                      } catch (e) {
                        return InkWell(
                          onTap: () async => showDialog<void>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('ユーザを選択'),
                                content: SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      final e = data[index];
                                      return ListTile(
                                        title: Text(e.id.toString()),
                                        onTap: () {
                                          selectedUser.value = e;
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          child: Text(
                            'エラーが発生しました\n$e',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }
                    },
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class BigQuestionResult extends StatelessWidget {
  const BigQuestionResult({
    super.key,
    required this.selectedUser,
  });

  final ValueNotifier<UserModel?> selectedUser;

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        elevation: 5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(
                  255,
                  0,
                  140,
                  255,
                ),
                Color.fromARGB(255, 255, 0, 85),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.white.withOpacity(0.85),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      '総合得点',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        textBaseline: TextBaseline.ideographic,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      '${List<int>.generate(9, (index) => index).map(
                                        (e) {
                                          return selectedUser
                                              .value!.result.items[e].toPoint;
                                        },
                                      ).reduce((value, element) => value + element)}点',
                                      style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        textBaseline: TextBaseline.ideographic,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Text(
        'エラーが発生しました\n$e',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
    }
  }
}

class BigQuestionResult3 extends StatelessWidget {
  const BigQuestionResult3({
    super.key,
    required this.selectedUser,
  });

  final ValueNotifier<UserModel?> selectedUser;

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        elevation: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: DevicePosition.projector3.onPrimary
                  .map((e) => e.withOpacity(0.7))
                  .toList(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white.withOpacity(0.85),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      ' 3 ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.white.withOpacity(0.85),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  '大問小計',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${List<int>.generate(3, (index) => index + 6).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].toPoint;
                                    },
                                  ).reduce((value, element) => value + element)}点',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '(正${List<int>.generate(3, (index) => index + 6).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].correctCount;
                                    },
                                  ).reduce((value, element) => value + element)}, 誤${List<int>.generate(3, (index) => index + 6).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].wrongCount;
                                    },
                                  ).reduce((value, element) => value + element)})',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問1',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[6].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[6].correctCount}, 誤${selectedUser.value?.result.items[6].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問2',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[7].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[7].correctCount}, 誤${selectedUser.value?.result.items[7].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問3',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[8].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[8].correctCount}, 誤${selectedUser.value?.result.items[8].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Text(
        'エラーが発生しました\n$e',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
    }
  }
}

class BigQuestionResult2 extends StatelessWidget {
  const BigQuestionResult2({
    super.key,
    required this.selectedUser,
  });

  final ValueNotifier<UserModel?> selectedUser;

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        elevation: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: DevicePosition.projector2.onPrimary
                  .map((e) => e.withOpacity(0.7))
                  .toList(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white.withOpacity(0.85),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      ' 2 ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.white.withOpacity(0.85),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  '大問小計',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${List<int>.generate(3, (index) => index + 3).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].toPoint;
                                    },
                                  ).reduce((value, element) => value + element)}点',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '(正${List<int>.generate(3, (index) => index + 3).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].correctCount;
                                    },
                                  ).reduce((value, element) => value + element)}, 誤${List<int>.generate(3, (index) => index + 3).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].wrongCount;
                                    },
                                  ).reduce((value, element) => value + element)})',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問1',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[3].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[3].correctCount}, 誤${selectedUser.value?.result.items[3].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問2',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[4].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[4].correctCount}, 誤${selectedUser.value?.result.items[4].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問3',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[5].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[5].correctCount}, 誤${selectedUser.value?.result.items[5].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Text(
        'エラーが発生しました\n$e',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
    }
  }
}

class BigQuestionResult1 extends StatelessWidget {
  const BigQuestionResult1({
    super.key,
    required this.selectedUser,
  });

  final ValueNotifier<UserModel?> selectedUser;

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        elevation: 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: DevicePosition.projector1.onPrimary
                  .map((e) => e.withOpacity(0.7))
                  .toList(),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white.withOpacity(0.85),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      ' 1 ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.white.withOpacity(0.85),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  '大問小計',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '${List<int>.generate(3, (index) => index).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].toPoint;
                                    },
                                  ).reduce((value, element) => value + element)}点',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '(正${List<int>.generate(3, (index) => index).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].correctCount;
                                    },
                                  ).reduce((value, element) => value + element)}, 誤${List<int>.generate(3, (index) => index).map(
                                    (e) {
                                      return selectedUser
                                          .value!.result.items[e].wrongCount;
                                    },
                                  ).reduce((value, element) => value + element)})',
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問1',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[0].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[0].correctCount}, 誤${selectedUser.value?.result.items[0].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問2',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[1].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[1].correctCount}, 誤${selectedUser.value?.result.items[1].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      '小問3',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${selectedUser.value?.result.items[2].toPoint}点',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(正${selectedUser.value?.result.items[2].correctCount}, 誤${selectedUser.value?.result.items[2].wrongCount})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Text(
        'エラーが発生しました\n$e',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
    }
  }
}
