import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/model/product..dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/view/detial/components/body.dart';
import 'package:furniture_app/view/home/components/body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: BodyDetails(product: product),

    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon:const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon:const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize,)
      ],
    );
  }
}
