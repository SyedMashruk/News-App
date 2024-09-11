import 'package:flutter/material.dart';
import 'package:news/data/category_data.dart';
import 'package:news/widgets/custom/category_grid_item.dart';
import 'package:news/widgets/screens/show_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 4,
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                children: [
                  for (final category in categoryData)
                    CategoryGridItem(
                      transparency: 0.4,
                      homeCategory: category,
                      onSelectCategory: () {
                        String selectedCategory = '';
                        selectedCategory = category.id;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShowScreen(
                                  selectedCategory: selectedCategory,
                                  newsTitle: category.title,
                                )));
                      },
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
