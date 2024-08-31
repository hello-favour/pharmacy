// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/constants/firebase_constants.dart';
import 'package:pharmacy/models/categories_model.dart';
import 'package:pharmacy/providers/firebase_providers.dart';

final categoriesServiceProvider = Provider<CategoryService>((ref) =>
    CategoryService(firebaseFirestore: ref.watch(firebaseFirestoreProvider)));

class CategoryService {
  final FirebaseFirestore _firebaseFirestore;
  CategoryService({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  CollectionReference get _categories =>
      _firebaseFirestore.collection(FirebaseConstants.categories);

  Stream<List<CategoryModel>> getCategories() {
    return _categories.snapshots().map((event) {
      List<CategoryModel> categoriesList = [];
      for (var doc in event.docs) {
        categoriesList
            .add(CategoryModel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return categoriesList;
    });
  }
}
