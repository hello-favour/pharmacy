class ProductModel {
  String? productImage;
  String? productName;
  double? productPrice;
  bool? isAvailable;
  String? productDescription;

  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.isAvailable,
    required this.productDescription,
  });
}
