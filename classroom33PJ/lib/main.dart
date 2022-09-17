import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'page/position_select.dart';
import 'private/key.dart';

Future<void> main() async {
   SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // 問題出力
  // for (final bigQuestions in questions) {
  //   print(
  //     '${bigQuestions.id},${bigQuestions.title},${bigQuestions.category.title}',
  //   );
  //   for (final bigQuestion in bigQuestions.questions) {
  //     for (final e in bigQuestion.questions) {
  //       print(
  //         ',,,${e.questionStatement},${e.choices.toString().replaceAll('[', '').replaceAll(']', '')},${e.correctAnswerIndex}',
  //       );
  //     }
  //   }
  //   print(',,,,,,,,');
  // }
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: true,
  );
  await runZonedGuarded(
    () async {
      runApp(
        ProviderScope(child: MaterialApp(
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true,
            colorSchemeSeed: const Color.fromARGB(255, 0, 94, 255),
            fontFamily: 'NotoSansJP',
          ),
          home: const MyApp(),
        ),),
      );
    },
    (error, stack) {
      log(error.toString(), name: 'ERROR', error: error, stackTrace: stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PositionSelectPage();
  }
}
