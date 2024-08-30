import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/utils/error_page.dart';
import 'package:pharmacy/pages/home_page.dart';
import 'package:pharmacy/pages/signin.dart';
import 'package:pharmacy/providers/auth_provider.dart';
import 'package:pharmacy/utils/loading_page.dart';

class AuthMain extends ConsumerWidget {
  const AuthMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return const HomePage();
          return const SignInPage();
        },
        error: ((error, stackTrace) => ErrorPage(
              e: error,
              stackTrace: stackTrace,
            )),
        loading: () => const LoadingPage());
  }
}
