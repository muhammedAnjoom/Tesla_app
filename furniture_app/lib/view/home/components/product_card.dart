import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/product..dart';
import '../../../size_config.dart';
import '../../components/title_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  required this.product,  this.press
  }) : super(key: key);


  final Product product;
  final  press;

  @override
  Widget build(BuildContext context) {
      double defaultSize = SizeConfig.defaultSize!;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        // height: 250,
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/icons/loading.gif",
                  image: product.image!,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Text("error image");
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(title: product.title!),
              ),
              SizedBox(height: defaultSize/2,),
              Text("\$${product.price}"),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}