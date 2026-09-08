import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_batch16/model/product_model.dart';
import 'package:flutter_batch16/utils/url.dart';

import 'package:http/http.dart';

class ProductController {
  List<Data> productList = [];

  Future<void> getProductList() async {
    final Uri url = Uri.parse(AppUrl.readProduct);

    Response response = await get(url);
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }

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

  Future<bool?> createProduct(Data data) async {
    final Uri uri = Uri.parse(AppUrl.createProduct);
    final Response response = await post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "ProductName": data.productName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice
        },
      ),
    );
    print(response.statusCode);
    print(response.body);


    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
