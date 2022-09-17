import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final averagePointFutureProvider = FutureProvider<double>((ref) async {
  final res = await Supabase.instance.client.rpc('average').execute();
  return double.parse(res.data.toString());
});
