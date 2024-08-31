// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String productID;
  String name;
  String image;
  double price;
  double oldPrice;
  bool? isAvailable;
  String description;
  String? categoryName;
  ProductModel({
    required this.productID,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.isAvailable,
    required this.description,
    this.categoryName,
  });

  ProductModel copyWith({
    String? productID,
    String? name,
    String? image,
    double? price,
    double? oldPrice,
    bool? isAvailable,
    String? description,
    String? categoryName,
  }) {
    return ProductModel(
      productID: productID ?? this.productID,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productID': productID,
      'name': name,
      'image': image,
      'price': price,
      'oldPrice': oldPrice,
      'isAvailable': isAvailable,
      'description': description,
      'categoryName': categoryName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productID: map['productID'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      oldPrice: map['oldPrice'] as double,
      isAvailable:
          map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      description: map['description'] as String,
      categoryName:
          map['categoryName'] != null ? map['categoryName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(productID: $productID, name: $name, image: $image, price: $price, oldPrice: $oldPrice, isAvailable: $isAvailable, description: $description, categoryName: $categoryName)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.productID == productID &&
        other.name == name &&
        other.image == image &&
        other.price == price &&
        other.oldPrice == oldPrice &&
        other.isAvailable == isAvailable &&
        other.description == description &&
        other.categoryName == categoryName;
  }

  @override
  int get hashCode {
    return productID.hashCode ^
        name.hashCode ^
        image.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        isAvailable.hashCode ^
        description.hashCode ^
        categoryName.hashCode;
  }
}
