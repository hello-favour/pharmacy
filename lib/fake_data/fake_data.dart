import 'package:pharmacy/constants/app_images.dart';
import 'package:pharmacy/models/categories_model.dart';
import 'package:pharmacy/models/product_model.dart';

class FakeData {
  List<CategoryModel> categories = [
    CategoryModel(name: "Contraceptives", image: AppImages.pills2),
    CategoryModel(name: "Cough Syrup", image: AppImages.pills3),
    CategoryModel(name: "Magnesium Pills", image: AppImages.pills4),
    CategoryModel(name: "Pain Killers", image: AppImages.pills5),
    CategoryModel(name: "ARVs", image: AppImages.pills6),
    CategoryModel(name: "Para", image: AppImages.pills7),
  ];

  List<ProductModel> product = [
    ProductModel(
      productImage: AppImages.pills1,
      productName: "ARV tablets",
      productPrice: 1.99,
      productDescription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ac ultricies risus, eget maximus felis. Proin tincidunt iaculis neque non sagittis. Sed ullamcorper.",
    ),
    ProductModel(
      productImage: AppImages.pills2,
      productName: "Vitamin D3 Capsules",
      productPrice: 3.49,
      productDescription:
          "Daily supplement supporting bone health and immunity. Provides essential Vitamin D3 to help maintain strong bones, teeth, and overall wellness in every capsule.",
    ),
    ProductModel(
      productImage: AppImages.pills3,
      productName: "Cough Syrup",
      productPrice: 4.99,
      productDescription:
          "Relieves coughs and soothes throat irritation. This syrup contains natural honey and herbal extracts for gentle, effective relief from coughs and sore throats.",
    ),
    ProductModel(
      productImage: AppImages.pills4,
      productName: "Antiseptic Cream",
      productPrice: 2.79,
      productDescription:
          "Multipurpose antiseptic cream for cuts, grazes, minor burns. Provides quick relief, protects against infection, and promotes healing while soothing skin.",
    ),
    ProductModel(
      productImage: AppImages.pills5,
      productName: "Pain Relief Tablets",
      productPrice: 5.99,
      productDescription:
          "Effective pain relief for headaches, migraines, muscle aches. Fast-acting formula delivers quick, targeted relief to help you feel better fast.",
    ),
    ProductModel(
      productImage: AppImages.pills6,
      productName: "Anti-Fungal Ointment",
      productPrice: 6.49,
      productDescription:
          "Treats and prevents fungal infections like athlete's foot and ringworm. Soothes itching, irritation, and helps restore skin to healthy condition.",
    ),
  ];
}
