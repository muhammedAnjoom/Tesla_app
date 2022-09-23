

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/product..dart';
import '../../../size_config.dart';

// ignore: must_be_immutable
class ProductInfo extends StatelessWidget {
  ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 34.5,
      width: defaultSize * 15,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.category ?? "no name", style: lightTextStyle),
          SizedBox(
            height: defaultSize,
          ),
          Text(
            product.title ?? "no title",
            style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            "Form",
            style: lightTextStyle,
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
                fontSize: defaultSize * 1.5,
                fontWeight: FontWeight.bold,
                height: 1.6),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            "Available Colors",
            style: lightTextStyle,
          ),
          Row(
            children: [
              bulidColor(color: Colors.green,isActive: true),
              bulidColor(color: Colors.grey),
              bulidColor(color: Colors.black)
            ],
          )
        ],
      ),
    );
  }

  Container bulidColor({Color? color, bool isActive = false}) {
    double defaultSize = SizeConfig.defaultSize!;
    return Container(
      padding: const EdgeInsets.all(3),
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: isActive == true
          ? const Icon(
              Icons.check,
              color: Colors.white,
              size: 15,
            )
          : null,
    );
  }
}
