import 'package:flutter/material.dart';
import 'package:furniture_app/model/product..dart';
import 'package:furniture_app/view/detial/detial_page.dart';
import 'package:furniture_app/view/home/components/category_card.dart';

import '../../../model/categories.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        category.length,
        (index) => CardItem(
          category: category[index],
        ),
      )),
    );
  }
}
