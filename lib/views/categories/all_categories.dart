import 'package:flutter/material.dart';
import 'package:winter_food/common/background_container.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/constants/uidata.dart';
import 'package:winter_food/views/categories/widgets/category_tile.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (_, index) {
            final category = categories[index];
            return CategoryTile(category: category);
          },
        ),
      ),
    );
  }
}

