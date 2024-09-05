import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/components/home_category_widget.dart';
import 'package:pharmacy/components/home_product_widget.dart';
import 'package:pharmacy/components/search_delegate_widget.dart';
import 'package:pharmacy/constants/reusable_text.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(8),
            onPressed: () {
              showSearch(context: context, delegate: SeachDelegate(ref));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 50),
            Card(
              elevation: 1,
              child: SizedBox(
                height: 60,
                child: TextField(
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
            SizedBox(height: 16),
            HomeCategoryWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: "Products",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                ReusableText(
                  text: "See All",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ],
            ),
            ProductWidget(),
          ],
        ),
      ),
    );
  }
}
