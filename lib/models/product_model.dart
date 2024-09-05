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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productID: json['productID'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: json['price'] as double,
      oldPrice: json['oldPrice'] as double,
      isAvailable:
          json['isAvailable'] != null ? json['isAvailable'] as bool : null,
      description: json['description'] as String,
      categoryName:
          json['categoryName'] != null ? json['categoryName'] as String : null,
    );
  }
}
