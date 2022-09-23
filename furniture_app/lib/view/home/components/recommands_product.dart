import 'package:flutter/material.dart';
import 'package:furniture_app/view/detial/detial_page.dart';
import 'package:furniture_app/view/home/components/product_card.dart';

import '../../../model/product..dart';
import '../../../size_config.dart';

class RecommandsProduct extends StatelessWidget {
  const RecommandsProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        // we just turn off grid view scrolling
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.700),
        itemBuilder: (context, index) => ProductCard(
          product: product[index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => DetailsPage(
                          product: product[index],
                        )));
          },
        ),
      ),
    );
  }
}
