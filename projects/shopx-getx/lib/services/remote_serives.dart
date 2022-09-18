

import 'package:getx_set/model/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var respons = await client.get(
      Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
    );
    if(respons.statusCode == 200){
      var jsonString = respons.body;
      return ProductFromJson(jsonString);
    }else{
      return [];
    }
  }

}
