import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/components/home_category_widget.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Card(
              elevation: 0,
              child: SizedBox(
                height: screenHeight * 0.99,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.tune,
                      size: 20,
                      color: Colors.black,
                    ),
                    hintText: "Search Product",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    contentPadding: EdgeInsets.only(top: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const HomeCategoryWidget(),
          ],
        ),
      ),
    );
  }
}
