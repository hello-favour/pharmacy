import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/models/categories.dart';
import 'package:pharmacy/services/categoriesservice.dart';

final categoriesProvider = StreamProvider((ref) {
  final categoriesController = ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategoris();
});

final categoriesControllerProvider =
    StateNotifierProvider<CategoriesController, bool>((ref) {
  final categoriesService = ref.watch(categoriesServiceProvider);

  return CategoriesController(
    categoriesService: categoriesService,
    ref: ref,
  );
});

class CategoriesController extends StateNotifier<bool> {
  final CategoriesService _categoriesSevice;
  final Ref _ref;

  CategoriesController(
      {required CategoriesService categoriesService,
      required Ref ref,
      firebaseStorageService})
      : _categoriesSevice = categoriesService,
        _ref = ref,
        super(false);

  Stream<List<Categories>> getCategoris() {
    return _categoriesSevice.getCategories();
  }
}
