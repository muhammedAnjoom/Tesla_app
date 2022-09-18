import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_set/model/product.dart';

import '../controller/product_controller.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [BoxShadow(blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: 180,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network(
                product.imageLink ?? "no image",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text("imag error");
                },
              ),
            ),
            Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Obx(() => IconButton(
                        icon: product.isFavorite.value == false
                            ? Icon(Icons.favorite_border_outlined)
                            : Icon(Icons.favorite),
                        onPressed: () {
                          if (product.isFavorite.value == false) {
                            product.isFavorite.toggle();
                            productController.count++;
                          }else{
                            product.isFavorite.toggle();
                            productController.count--;
                          }
                        },
                      )),
                )),
          ]),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              product.name ?? 'no name',
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.rating.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              "\$${product.price}",
              style: TextStyle(fontSize: 32, fontFamily: 'avenir'),
            ),
          )
        ],
      ),
    );
  }
}
