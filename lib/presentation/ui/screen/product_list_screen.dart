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
          padding: const EdgeInsets.all(2),
          itemCount: _productController.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            final product = _productController.productList[index];

            return ProductItem(
              productName: product.productName ?? 'No Name',
              productCode: product.productCode?.toString() ?? 'N/A',
              productQuantity: product.qty ?? 0,
              productPrice: (product.unitPrice ?? 0).toDouble(),
              productUnitPrice: product.unitPrice ?? 0,
              total: (product.totalPrice ?? 0).toDouble(),
              imageLink: product.img,

              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditProductScreen(),
                  ),
                );
              },

              onDelete: () {
                // তোমার delete code
              },
            );
          },
        )
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Product List'),
      backgroundColor: Colors.blue,
      actions: [
        IconButton(
            onPressed: () async {
              await getData();
            },
            icon: Icon(Icons.refresh))
      ],
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddProductScreen(),
          ),
        );
        await getData();
      },
      child: const Icon(Icons.add),
    );
  }
}
