import 'dart:convert';

import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OnWaitingForAdminPage extends HookConsumerWidget {
  const OnWaitingForAdminPage({required this.stateItem, super.key});
  final StateItem stateItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
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
      floatingActionButton: kDebugMode
          ? InkWell(
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
            )
          : null,
    );
  }
}
