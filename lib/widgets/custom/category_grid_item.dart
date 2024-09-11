import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.homeCategory,
    required this.onSelectCategory,
    required this.transparency,
  });

  final Category homeCategory;
  final void Function() onSelectCategory;
  final double transparency;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onSelectCategory,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(homeCategory.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              color: Colors.black.withOpacity(transparency),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              homeCategory.title,
              style: GoogleFonts.josefinSans(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
