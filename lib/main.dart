import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/firebase_options.dart';
import 'package:pharmacy/pages/auth_main.dart';
import 'package:pharmacy/utils/error_page.dart';
import 'package:pharmacy/utils/loading_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully.");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  try {
    return await Firebase.initializeApp();
  } catch (e) {
    print("Error in firebaseInitializerProvider: $e");
    rethrow; // Rethrow to let the error be handled in the UI
  }
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
        data: (data) {
          print("Firebase initialization successful, navigating to AuthMain.");
          return const AuthMain();
        },
        error: (error, stackTrace) {
          print("Error during Firebase initialization: $error");
          return ErrorPage(e: error, stackTrace: stackTrace);
        },
        loading: () {
          print("Firebase is initializing...");
          return const LoadingPage();
        },
      ),
    );
  }
}
