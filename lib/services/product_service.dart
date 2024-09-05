import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/constants/firebase_constants.dart';
import 'package:pharmacy/models/product_model.dart';
import 'package:pharmacy/providers/firebase_providers.dart';

final productServiceProvider = Provider((ref) {
  return ProductService(
      firebaseFirestore: ref.watch(firebaseFirestoreProvider));
});

class ProductService {
  final FirebaseFirestore _firebaseFirestore;

  ProductService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  CollectionReference get products =>
      _firebaseFirestore.collection(FirebaseConstants.products);

  Stream<List<ProductModel>> getProducts() {
    return products.snapshots().map((event) {
      List<ProductModel> productslist = [];
      for (var doc in event.docs) {
        products.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return productslist;
    });
  }

  Stream<ProductModel> getProductById(String productId) {
    return products.doc(productId).snapshots().map(
        (event) => ProductModel.fromJson(event.data() as Map<String, dynamic>));
  }

  Stream<List<ProductModel>> getProductByCategory(String categoryname) {
    return products
        .where('categoryname', isEqualTo: categoryname)
        .snapshots()
        .map((event) {
      List<ProductModel> products = [];
      for (var doc in event.docs) {
        products.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<List<ProductModel>> getRelatedProducts(String categoryname) {
    return products
        .where('categoryname', isEqualTo: categoryname)
        .snapshots()
        .map((event) {
      List<ProductModel> products = [];
      for (var doc in event.docs) {
        products.add(ProductModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }
}
