import 'package:admin/page/result.dart';
import 'package:classroom33common/classroom33common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'page/main.dart';
import 'page/user_register.dart';
import 'private/key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: kDebugMode,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'C33 Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          fontFamily: 'NotoSansJP',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom33 Admin'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref
                ..refresh(usersFutureProvider)
                ..refresh(topUsersFutureProvider);
            },
            label: const Text('Refresh Users'),
          )
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            elevation: 5,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.admin_panel_settings),
                label: Text('Admin'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people),
                label: Text('Register'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Result'),
              ),
            ],
            onDestinationSelected: (index) => selectedIndex.value = index,
            selectedIndex: selectedIndex.value,
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex.value,
              children: const [
                MainPage(),
                UserRegisterPage(),
                ResultPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
