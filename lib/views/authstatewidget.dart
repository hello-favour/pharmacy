import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/controllers/authcontroller.dart';
import 'package:pharmacy/views/home.dart';
import 'package:pharmacy/views/signin.dart';
import 'package:pharmacy/widgets/errortext.dart';
import 'package:pharmacy/widgets/loader.dart';

class AuthState extends ConsumerWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    return authState.when(
        data: (data) {
          if (data != null) return Home();
          return SignIn();
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
