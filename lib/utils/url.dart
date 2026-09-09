class AppUrl {
  static const String _baseUrl =
      'https://crud-api-ostad-live.onrender.com/api/v1';
  static const String readProduct = '$_baseUrl/ReadProduct';
  static const String createProduct = '$_baseUrl/CreateProduct';

  static String deleteProduct(String? id) => '$_baseUrl/DeleteProduct/$id';

  static String updateProduct(String? id) => '$_baseUrl/UpdateProduct/$id';
}
