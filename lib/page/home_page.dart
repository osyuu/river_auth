
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_auth/page/auth/auth_provider.dart';
import 'package:river_auth/page/auth/login_page.dart';

import 'my_page.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StreamProvider を監視し、AsyncValue<User?> を取得する。
    final authStateAsync = ref.watch(authStateChangesProvider);
    // パターンマッチングを使用して、状態をUIにマッピングする
    return authStateAsync.when(
      data: (user) => user != null ? const MyPage() : const LoginPage(),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}