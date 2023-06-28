import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_auth/data/Repository/authRepository.dart';
import 'package:river_auth/page/auth/auth_notifier.dart';

final authNotifierProvider = AsyncNotifierProvider.autoDispose<AuthNotifier, void>(() => AuthNotifier());

final authStateChangesProvider = StreamProvider.autoDispose((ref) {
  final firebaseAuth = ref.watch(authRepositoryProvider);
  return firebaseAuth.user;
});

//* Repository
final authRepositoryProvider = Provider<AuthRepository>(
        (ref) => AuthRepository()
);

final emailProvider = StateProvider.autoDispose((ref) => TextEditingController(text: ''));

final passwordProvider = StateProvider.autoDispose((ref) => TextEditingController(text: ''));