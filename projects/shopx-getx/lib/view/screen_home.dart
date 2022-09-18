import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:getx_set/controller/product_controller.dart';
import 'package:getx_set/view/prdouctCard.dart';
import 'package:http/http.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          Row(
            children: [
              GetX<ProductController>(
                builder: (controller) {
                  return Text(
                    controller.count.toString(),
                    style:const TextStyle(color: Colors.black),
                  );
                },
              ),
              const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  "ShopX",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Icon(
                Icons.list,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.grid_view),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Expanded(child: Obx(() {
            if (productController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return AlignedGridView.count(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                itemCount: productController.productList.length,
                crossAxisSpacing: 20,
                itemBuilder: (context, index) {
                  final product = productController.productList[index];
                  return ProductCard(product: product
                      // isFavorite: product.isFavorite.value,
                      );
                },
              );
            }
          })),
        ],
      ),
    );
  }
}
