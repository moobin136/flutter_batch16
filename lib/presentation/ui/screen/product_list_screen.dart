import 'package:flutter_batch16/controller/product_controller.dart';
import 'package:flutter_batch16/export.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController _productController = ProductController();
  bool _isLoading = true;

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });

    await _productController.getProductList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double size =
        MediaQuery.of(context).size.width / MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: _buildFloatingButton(context),
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _productController.productList.isEmpty
                ? const Center(child: Text('No Products Found!'))
                : GridView.builder(
                    itemCount: _productController.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: size * 0.9,
                      crossAxisSpacing: 0.20,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {                      
                      final product = _productController.productList[index];
                      return ProductItem(
                        productName: product.productName ?? 'No Name',
                        productCode: product.productCode?.toString() ?? 'N/A',
                        productQuantity: product.qty ?? 0,
                        productPrice: (product.unitPrice ?? 0).toDouble(),
                        onEdit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProductScreen(),
                            ),
                          );
                        },
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                  'Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        elevation: 0,
                                        backgroundColor: Color(0xC6D53232),
                                        content: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Product deleted successfully',
                                            style: TextStyle(
                                              color: Color(0xFFFDFDFD),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Product List'),
      backgroundColor: Colors.blue,
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddProductScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
