import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharmacy/controllers/authcontroller.dart';
import 'package:pharmacy/views/cartpage.dart';
import 'package:pharmacy/widgets/categories_widgets.dart';
import 'package:pharmacy/widgets/errortext.dart';
import 'package:pharmacy/widgets/loader.dart';
import 'package:pharmacy/widgets/products_widget.dart';
import 'package:pharmacy/widgets/searchwidget.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = FirebaseAuth.instance.currentUser;

    final userData = ref.watch(getUserDataProvider(currentUser!.uid));
    return userData.when(
        data: (data) {
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                              child: const Icon(
                                Icons.shopping_cart_rounded,
                                color: Colors.white,
                              ),
                            ),
                            data.cart != null
                                ? Positioned(
                                    top: 0,
                                    right: 6,
                                    child: Text(
                                      data.cart!.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    ))
                                : const Text("")
                          ],
                        )),
                  ),
                ],
                automaticallyImplyLeading: false,
              ),
              body: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "What are you looking for?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                        padding: EdgeInsets.all(2.0), child: SearchWidget()),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CategoriesWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Products_Widget()
                  ],
                ),
              ));
        },
        error: (error, stackTrace) => ErrorText(
              error: error.toString(),
            ),
        loading: () => const Loader());
  }
}
