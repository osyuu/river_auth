
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

class AuthNotifier extends AutoDisposeAsyncNotifier<void> {
  AuthNotifier()
      : super();

  @override
  FutureOr<void> build() async {}

  Future<void> signUp() async {
    final authRepository = ref.read(authRepositoryProvider);
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    state = const AsyncLoading();
    await AsyncValue.guard(() => authRepository.signUp(
        email: email.value.text,
        password: password.value.text
    ));
  }

  Future<void> login() async {
    final authRepository = ref.read(authRepositoryProvider);
    final email = ref.read(emailProvider);
    final password = ref.read(passwordProvider);

    state = const AsyncLoading();
    await AsyncValue.guard(() => authRepository.logInWithEmailAndPassword(
        email: email.value.text,
        password: password.value.text
    ));
  }

  Future<void> logout() async {
    final authRepository = ref.read(authRepositoryProvider);

    authRepository.logout();
  }
}