
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

@RoutePage()
class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailProvider);
    final passwordlController = ref.watch(passwordProvider);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Signup'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'email'),
                ),
                TextField(
                  controller: passwordlController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(labelText: 'password'),
                  obscureText: true,
                ),
                _SignupButton(),
              ],
            ),
          ),
        )
    );
  }
}

class _SignupButton extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: !state.isLoading ? () {
        ref.read(authNotifierProvider.notifier).signUp();
      } : null,
      child: state.isLoading ? const CircularProgressIndicator() : const Text('SIGNUP'),
    );
  }
}