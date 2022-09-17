import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:classroom33common/classroom33common.dart';


class OnWaitingForAdminPage extends HookConsumerWidget {
  const OnWaitingForAdminPage({required this.stateItem, super.key});
  final StateItem stateItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnWaitingForAdminPage'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            const Text(
              '管理者の開始を待っています',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('このままお待ちください'),
            const SizedBox(height: 20),
            const CircularProgressIndicator.adaptive(),
            Text(
              const JsonEncoder.withIndent('  ').convert(
                stateItem.toJson(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onDoubleTap: () async {
          await Supabase.instance.client
              .from('state')
              .update(<String, dynamic>{
                'big_question_state': BigQuestionState.running.name,
              })
              .eq('position', stateItem.position.name)
              .execute();
        },
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('強制開始'),
          icon: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
