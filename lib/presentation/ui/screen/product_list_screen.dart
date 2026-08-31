

import 'package:flutter_batch16/export.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late double size = MediaQuery.of(context).devicePixelRatio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _buildFloatingButton(context),
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: size * 0.43,
              // crossAxisSpacing: 0.20,
              mainAxisSpacing: 4
            ),
            itemBuilder: (context, index) => ProductItem(
              productName: 'Product 1',
              productCode: '0xsdsfdsf',
              productQuantity: 10,
              productPrice: 1000.0,
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
            ),
          ),
        ));
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
