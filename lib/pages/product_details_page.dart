import 'package:flutter/material.dart';
import 'package:pharmacy/components/related_products_widget.dart';
import 'package:pharmacy/constants/reusable_text.dart';
import 'package:pharmacy/models/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Stack(
              children: [
                Image.network(
                  product.image,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.shopping_basket,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 60,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ReusableText(
                text: product.name,
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReusableText(
                  text: product.description,
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "\$${product.price}",
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  ReusableText(
                    text: "\$${product.oldPrice}",
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const ReusableText(text: "Add To Cart"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "Similar Products",
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  ReusableText(
                    text: "See All",
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            RelatedProductWidget(
              categoryName: product.categoryName.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
