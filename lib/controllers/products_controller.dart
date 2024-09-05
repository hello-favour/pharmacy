import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/models/product_model.dart';
import 'package:pharmacy/services/product_service.dart';

//HERE PROVIDERS

final productsControllerProvider =
    StateNotifierProvider<ProductController, bool>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductController(productService: productService, ref: ref);
});

final getProductProvider = StreamProvider(
    (ref) => ref.watch(productsControllerProvider.notifier).getProducts());

final getProductByCategoryProvider =
    StreamProvider.family((ref, String categoryName) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getProductByCategoryName(categoryName);
});

final getRelatedProductProvidder =
    StreamProvider.family((ref, String categoryName) {
  return ref
      .watch(productsControllerProvider.notifier)
      .getRelatedProducts(categoryName);
});

final searchProductProvider = StreamProvider.family((ref, String search) {
  return ref.watch(productsControllerProvider.notifier).searchProducts(search);
});

//HERE PRODUCT CONTROLLER
class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  // ignore: unused_field
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

  Stream<List<ProductModel>> getProductByCategoryName(String categoryName) {
    return _productService.getProductByCategory(categoryName);
  }

  Stream<List<ProductModel>> getRelatedProducts(String categoryName) {
    return _productService.getRelatedProducts(categoryName);
  }

  Stream<List<ProductModel>> searchProducts(String search) {
    return _productService.searchProducts(search);
  }
}
