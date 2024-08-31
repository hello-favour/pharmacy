import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int selectedIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      selectedIndex == index;
    });
  }

  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        currentIndex: selectedIndex,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
              size: 30,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
              color: Colors.red,
              size: 30,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.red,
              size: 30,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.red,
              size: 30,
            ),
            label: "Profile",
          )
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
