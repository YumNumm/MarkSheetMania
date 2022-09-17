// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnUserChoicePage extends HookConsumerWidget {
  const OnUserChoicePage({required this.stateItem, super.key});
  final StateItem stateItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: ref.watch(usersFutureProvider).when<Widget>(
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            error: (error, stack) => Center(
              child: Text(error.toString()),
            ),
            data: (data) => Container(
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
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Colors.white.withOpacity(0.85),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(),
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: FittedBox(
                          child: Text(
                            '開始を待っています...',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          'このままお待ちください',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator.adaptive(),
                      if (kDebugMode)
                        Text(
                          const JsonEncoder.withIndent('  ').convert(
                            stateItem.toJson(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      floatingActionButton: kDebugMode
          ? FloatingActionButton.extended(
              onPressed: () async {
                final res = await Supabase.instance.client
                    .from('state')
                    .update(<String, dynamic>{
                      'big_question_state':
                          BigQuestionState.waitingForAdmin.name,
                    })
                    .eq('position', stateItem.position.name)
                    .execute();
                if (res.error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(res.error!.message),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('更新しました'),
                    ),
                  );
                }

                // TODO(YumNumm): ここで、ユーザの選択を反映させる
              },
              label: const Text('続行'),
            )
          : null,
    );
  }
}
