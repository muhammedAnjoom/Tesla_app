import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/model/categories.dart';
import 'package:furniture_app/services/fetchCategory.dart';
import 'package:furniture_app/size_config.dart';
import 'package:http/retry.dart';

import '../../compents/title_text.dart';
import 'category_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TitleText(
              title: "Brows by categories",
            ),
          ),
          FutureBuilder(
            future: fetchCategories(),
            builder: (context, snapshot) => snapshot.hasData
                ? CategoryWidget(
                    category: snapshot.data ?? [],
                  )
                : Center(child: Image.asset("assets/icons/ripple.gif")),
          )
        ],
      ),
    );
  }
}

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
