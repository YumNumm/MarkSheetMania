import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../schema/state/state.dart';

final stateItemStreamProvider =
    StreamProvider.family<StateItem, DevicePosition>((ref, position) async* {
  final subscription =
      Supabase.instance.client.from('state:position=eq.${position.name}').stream(['position']).execute();
  await for (final payload in subscription) {
    log(payload.toString());
    yield payload.map(StateItem.fromJson).toList()[0];
  }
});

final stateItemsStreamProvider =
    StreamProvider.autoDispose<List<StateItem>>((ref) async* {
  final subscription =
      Supabase.instance.client.from('state').stream(['position']).execute();
  await for (final payload in subscription) {
    yield payload.map(StateItem.fromJson).toList();
  }
});
