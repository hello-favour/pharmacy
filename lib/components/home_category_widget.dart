import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/constants/reusable_text.dart';
import 'package:pharmacy/controllers/category_controller.dart';
import 'package:pharmacy/pages/product_by_category_page.dart';
import 'package:pharmacy/utils/loading_page.dart';

class HomeCategoryWidget extends ConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProduct = ref.watch(getProductsProvider);
    return categoryProduct.when(
      data: (data) => Container(
        height: 150,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            final fakeData = data[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductByCategoryPage(
                        categoryName: data[index].name.toString(),
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        fakeData.image.toString(),
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    ReusableText(
                      text: fakeData.name.toString(),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      error: ((error, stackTrace) => ErrorWidget(error.toString())),
      loading: () => const LoadingPage(),
    );
  }
}
