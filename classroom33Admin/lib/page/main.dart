// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: ref.watch(stateItemsStreamProvider).when<Widget>(
            data: (datas) {
              final data = datas
                ..sort((a, b) => a.position.index.compareTo(b.position.index));
              return Wrap(
                children: [
                  if (data.every(
                    (e) =>
                        e.bigQuestionState == BigQuestionState.waitingForAdmin,
                  ))
                    FloatingActionButton.extended(
                      onPressed: () async {
                        final res = await Supabase.instance.client
                            .from('state')
                            .update(<String, dynamic>{
                              'big_question_state': 'running',
                            })
                            .like('position', 'projector%')
                            .execute();
                        if (res.error != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('ERROR: ${res.error?.message}'),
                            ),
                          );
                          return;
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('全てのライドを開始しました'),
                          ),
                        );
                      },
                      label: const Text('全体開始承認'),
                      icon: const Icon(Icons.check),
                    ),
                  ...data
                      .map<Widget>(
                        (e) => Card(
                          elevation: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: e.position.onPrimary
                                      .map((e) => e.withOpacity(0.7))
                                      .toList(),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                      e.position.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      e.bigQuestionState.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      'ユーザID:${e.userId} ライドID:${e.bigQuestionGroupId}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      const JsonEncoder.withIndent('  ')
                                          .convert(e),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Text(error.toString()),
          ),
    );
  }
}
