import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/model/product..dart';
import 'package:furniture_app/size_config.dart';

class BodyDetails extends StatelessWidget {
  BodyDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductInfo(
            product: product,
          )
        ],
      ),
    );
  }
}

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
      height: defaultSize * 37.5,
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
          )
        ],
      ),
    );
  }
}
