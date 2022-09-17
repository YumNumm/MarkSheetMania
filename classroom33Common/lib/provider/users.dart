import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../schema/user/user_model.dart';

/// 単一のユーザー情報を取得
/// [id]: ユーザーID
final userFutureProvoder = FutureProvider.family.autoDispose<UserModel, int>(
  (ref, id) async {
    final res = await Supabase.instance.client
        .from('users')
        .select()
        .eq('id', id)
        .single()
        .execute();
    if (res.error != null) {
      throw res.error!;
    }
    return UserModel.fromJson(res.data![0] as Map<String, dynamic>);
  },
);

/// 全てのユーザを取得
final usersFutureProvider =
    FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final res = await Supabase.instance.client
      .from('users')
      .select()
      .order('id')
      .execute();
  if (res.error != null) {
    throw res.error!;
  }
  return (res.data! as List)
      .map((dynamic e) => UserModel.fromJson(e as Map<String, dynamic>))
      .toList();
});

/// 得点トップ30を取得
final topUsersFutureProvider = FutureProvider<List<UserModel>>((ref) async {
  final res = await Supabase.instance.client
      .from('users')
      .select()
      .order('total_point')
      .limit(30)
      .execute();
  if (res.error != null) {
    throw res.error!;
  }
  return (res.data! as List)
      .map((dynamic e) => UserModel.fromJson(e as Map<String, dynamic>))
      .where((e) => e.totalPoint != null)
      .toList();
});

/// 全ての得点を取得
final totalPointsFutureProvider = FutureProvider<List<int>>((ref) async {
  final res = await Supabase.instance.client
      .from('users')
      .select('total_point')
      .order('total_point')
      .execute();
  if (res.error != null) {
    throw res.error!;
  }
  return (res.data! as List)
      .where((dynamic e) => e['total_point'] != null)
      .map((dynamic e) => e['total_point'] as int)
      .toList();
});
