import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/models/categories_model.dart';
import 'package:pharmacy/services/category_service.dart';

final categoriesControllerProvider =
    StateNotifierProvider<CategoryController, bool>((ref) {
  final categoriesService = ref.watch(categoriesServiceProvider);
  return CategoryController(categoryService: categoriesService, ref: ref);
});

final getProductsProvider = StreamProvider((ref) {
  final categoriesController = ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategories();
});

class CategoryController extends StateNotifier<bool> {
  final CategoryService _categoryService;
  final Ref _ref;

  CategoryController(
      {required CategoryService categoryService, required Ref ref})
      : _categoryService = categoryService,
        _ref = ref,
        super(false);

  Stream<List<CategoryModel>> getCategories() {
    return _categoryService.getCategories();
  }
}
