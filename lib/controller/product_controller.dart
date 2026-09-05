import 'dart:convert';
import 'package:flutter_batch16/model/product_model.dart';
import 'package:flutter_batch16/utils/url.dart';

import 'package:http/http.dart';

class ProductController {
  List<Data> productList = [];
  Future<void> getProductList() async {
    final Uri url = Uri.parse(AppUrl.readProduct);

    Response response = await get(url);
    print('Response status: ${response.statusCode}');

    try {
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        final productListDecoded = jsonDecode(response.body);
        ProductModel productModel = ProductModel.fromJson(productListDecoded);
        // productList.clear();
        productList = productModel.data ?? [];
        print('Product List: ${productList.length}');
      } else {
        print('error');
      }
    } catch (e) {
      print('error: $e');
    }
  }
}
