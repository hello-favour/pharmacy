import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/services/productservice.dart';
import 'package:pharmacy/services/storageservice.dart';

import 'package:uuid/uuid.dart';

final productsControllerProvider =
    StateNotifierProvider<ProductController, bool>((ref) {
  final productsService = ref.watch(productsServiceProvider);
  final storageService = ref.watch(storageServiceProvider);
  return ProductController(
      productService: productsService,
      ref: ref,
      storageService: storageService);
});

final getProductsProvider = StreamProvider(
    (ref) => ref.watch(productsControllerProvider.notifier).getProducts());

final getProductByCategoryNameProvider =
    StreamProvider.family((ref, String categoryname) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getProductByCategoryName(categoryname);
});

final relatedProductsProvider =
    StreamProvider.family((ref, String categoryname) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getRelatedProducts(categoryname);
});
final searchProducts = StreamProvider.family((ref, String search) {
  return ref.watch(productsControllerProvider.notifier).searchProducts(search);
});

class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;
  final StorageService _storageService;
  ProductController(
      {required ProductService productService,
      required Ref ref,
      required StorageService storageService})
      : _productService = productService,
        _ref = ref,
        _storageService = storageService,
        super(false);

  Stream<List<Product>> getProducts() {
    return _productService.getProducts();
  }

  Stream<List<Product>> getProductByCategoryName(String categoryname) {
    return _productService.getProductsByCategoryName(categoryname);
  }

  Stream<List<Product>> searchProducts(String search) {
    return _productService.searchProducts(search);
  }

  Stream<List<Product>> getRelatedProducts(String categoryname) {
    return _productService.getRelatedProducts(categoryname);
  }

  void createProduct(
      BuildContext context,
      File? file,
      String name,
      String description,
      double price,
      double oldprice,
      String categoryname) async {
    String productId = const Uuid().v1();
    final imageRes = await _storageService.storeFile(
      path: "products/",
      id: productId,
      file: file,
    );

    imageRes.fold((l) {
      // Check if l is not null before accessing l.message
      if (l != null && l.message != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message)));
      } else {
        // Handle the case where l or l.message is null, if needed
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('An error occurred')));
      }
    }, (r) async {
      final product = Product(
          productId: productId,
          image: r.toString(),
          name: name,
          description: description,
          price: price,
          oldprice: oldprice,
          categoryname: categoryname);
      final res = await _productService.addProduct(product);
      state = false;
      res.fold(
          (l) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l.message))), (r) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("product uploaded successfully")));
      });
    });
  }
}
