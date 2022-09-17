import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'page/state_distributor.dart';
import 'private/key.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [ProvidersLogger()],
      child: MaterialApp(
        title: 'C33 Controller',
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 0, 94, 255),
          fontFamily: 'NotoSansJP',
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PositionSelectPage(),
      ),
    );
  }
}

class PositionSelectPage extends HookConsumerWidget {
  const PositionSelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDeviceId =
        useState<DevicePosition>(DevicePosition.projector1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Position Selector'),
      ),
      body: Column(
        children: [
          // DevicePositionの一覧
          for (final item in DevicePosition.values)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:
                      item.onPrimary.map((e) => e.withOpacity(0.4)).toList(),
                ),
              ),
              child: RadioListTile(
                value: item,
                groupValue: selectedDeviceId.value,
                onChanged: (_) {
                  selectedDeviceId.value = item;
                },
                title: Text(item.toString()),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil<void>(
            MaterialPageRoute(
              builder: (context) => StateDistributorPage(
                position: selectedDeviceId.value,
              ),
            ),
            (_) => false,
          );
        },
        label: const Text('開始'),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
