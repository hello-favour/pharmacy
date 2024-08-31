import 'package:flutter/material.dart';
import 'package:pharmacy/fake_data/fake_data.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: FakeData().categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          final fakeData = FakeData().categories[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CircleAvatar(
                  child: Image.asset(
                    fakeData.image.toString(),
                    fit: BoxFit.cover,
                    height: 120,
                    width: 120,
                  ),
                ),
                Text(
                  fakeData.name.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
