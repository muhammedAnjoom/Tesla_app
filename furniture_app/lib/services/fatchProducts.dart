import 'dart:convert';

import 'package:furniture_app/model/product..dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProdfucts() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  final respnse = await http.get(Uri.parse(apiUrl));

  if (respnse.statusCode == 200) {
    // If the server did return a 200 ok response,
    // then parse to json
    List<Product> product = (json.decode(respnse.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
   return product;
  }else{
    throw Exception("faild to load");
  }
}
