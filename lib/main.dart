import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/pages/auth_main.dart';
import 'package:pharmacy/utils/error_page.dart';
import 'package:pharmacy/utils/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initializeProvider = ref.watch(firebaseInitializerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy',
      home: initializeProvider.when(
        data: (data) => const AuthMain(),
        error: (error, stackTrace) =>
            ErrorPage(e: error, stackTrace: stackTrace),
        loading: () => const LoadingPage(),
      ),
    );
  }
}
