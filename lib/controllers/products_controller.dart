import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/models/product_model.dart';
import 'package:pharmacy/services/product_service.dart';

class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;

  ProductController({required ProductService productService, required Ref ref})
      : _productService = productService,
        _ref = ref,
        super(false);

  Stream<List<ProductModel>> getProducts() {
    return _productService.getProducts();
  }

  Stream<ProductModel> getProductById(String productId) {
    return _productService.getProductById(productId);
  }
}
