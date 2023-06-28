import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_auth/routers/app_router.dart';

import 'auth_provider.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final emailController = ref.watch(emailProvider);
    final passwordlController = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
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
              _LoginButton(),
              TextButton(
                onPressed: () {
                  context.router.push(const SignupRoute());
                },
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(color: theme.primaryColor),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

class _LoginButton extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = context.router;
    final state = ref.watch(authNotifierProvider);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: !state.isLoading ?
          () async {
        await ref.read(authNotifierProvider.notifier).login();
      } : null,
      child: state.isLoading ? const CircularProgressIndicator() : const Text('LOGIN'),
    );
  }
}