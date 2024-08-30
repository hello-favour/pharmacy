import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Object e;
  final StackTrace stackTrace;
  const ErrorPage({super.key, required this.e, required this.stackTrace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(e.toString()),
          Text(stackTrace.toString()),
        ],
      ),
    );
  }
}
