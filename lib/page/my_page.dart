
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/auth_provider.dart';

@RoutePage()
class MyPage extends ConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
        title: const Text('HomePage'),
      ),
      body: const Center(
        child: Text('Welcome! Login状態!'),
      ),
    );
  }
}