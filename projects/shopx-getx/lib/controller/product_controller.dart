import 'package:get/state_manager.dart';
import 'package:getx_set/services/remote_serives.dart';

import '../model/product.dart';

class ProductController extends GetxController{
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  var count = 0.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
   void fetchProducts() async{
     isLoading(true);
    var product = await RemoteServices.fetchProducts();
    if(product != null){
      productList.value = product;
    }
    isLoading(false);
   }
}