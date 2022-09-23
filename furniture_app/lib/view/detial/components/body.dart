import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/model/product..dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/view/detial/components/product_descrpiton.dart';
import 'package:furniture_app/view/detial/components/product_info.dart';

class BodyDetails extends StatelessWidget {
  BodyDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductInfo(
            product: product,
          ),
          ProductDescrpiton(
            product: product,
            press: () {},
          )
        ],
      ),
    );
  }
}


