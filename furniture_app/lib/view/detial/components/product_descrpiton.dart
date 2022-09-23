import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/product..dart';
import '../../../size_config.dart';

class ProductDescrpiton extends StatelessWidget {
  const ProductDescrpiton({
    Key? key,
    required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return Container(
      constraints: BoxConstraints(maxHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.2),
              topRight: Radius.circular(defaultSize * 1.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subTitle ?? "no subTitle",
            style: TextStyle(
              fontSize: defaultSize * 1.8,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          Text(
            product.description ?? "no decription",
            style: TextStyle(color: kTextColor.withOpacity(0.7), height: 1.5),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextButton(
                onPressed: press,
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSize * 1.6),
                )),
          )
        ],
      ),
    );
  }
}