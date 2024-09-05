import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/constants/reusable_text.dart';
import 'package:pharmacy/controllers/products_controller.dart';
import 'package:pharmacy/pages/product_details_page.dart';
import 'package:pharmacy/utils/loading_page.dart';

class RelatedProductWidget extends ConsumerWidget {
  final String categoryName;
  const RelatedProductWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedProduct = ref.watch(getRelatedProductProvidder(categoryName));
    return relatedProduct.when(
      data: (data) => Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailsPage(),
                    settings: RouteSettings(arguments: data[index]),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                shadowColor: Colors.black.withOpacity(0.2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          data[index].image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: data[index].name,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                text: "\$${data[index].price}",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                              ),
                              ReusableText(
                                text: "\$${data[index].oldPrice}",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      error: (error, stackTrace) => ErrorWidget(error),
      loading: () => const LoadingPage(),
    );
  }
}
