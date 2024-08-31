import 'package:flutter/material.dart';
import 'package:pharmacy/constants/reusable_text.dart';
import 'package:pharmacy/fake_data/fake_data.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.zero,
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
                ReusableText(
                  text: fakeData.name.toString(),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
