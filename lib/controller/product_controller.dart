
import 'package:flutter_batch16/export.dart';

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

  Future<bool> deleteProduct(String? id) async {
    if (id == null || id.isEmpty) {
      print('Product ID is null or empty');
      return false;
    }

    final Uri url = Uri.parse(AppUrl.deleteProduct(id));

    try {
      final Response response = await get(url);

      print('Delete Status Code: ${response.statusCode}');
      print('Delete Response: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Delete Error: $e');
      return false;
    }
  }

  Future<bool> updateProduct(Data data) async {
    if (data.id == null || data.id!.isEmpty) {
      print('Product ID is null or empty');
      return false;
    }

    final Uri url = Uri.parse(
      AppUrl.updateProduct(data.id),
    );

    try {
      final Response response = await post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "ProductName": data.productName,
          "ProductCode": data.productCode,
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,
        }),
      );

      print('Update URL: $url');
      print('Update Status Code: ${response.statusCode}');
      print('Update Response: ${response.body}');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Update Error: $e');
      return false;
    }
  }
}
