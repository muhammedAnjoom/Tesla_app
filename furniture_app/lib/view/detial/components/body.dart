import 'package:flutter/material.dart';
import 'package:furniture_app/model/product..dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/view/detial/components/product_descrpiton.dart';
import 'package:furniture_app/view/detial/components/product_info.dart';

class BodyDetails extends StatelessWidget {
  const BodyDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHight! - AppBar().preferredSize.height,
        child: Stack(
          children: [
            ProductInfo(
              product: product,
            ),
            Positioned(
              top: defaultSize * 34.5,
              right: 0,
              left: 0,
              child: ProductDescrpiton(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 6.5,
              child: Hero(
                tag: product.id!,
                child: Image.network(
                  product.image ?? "no image",
                  height: defaultSize * 37.8,
                  width: defaultSize * 36.4,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
