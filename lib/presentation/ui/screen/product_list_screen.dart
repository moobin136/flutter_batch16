import 'package:flutter/material.dart';
import 'package:flutter_batch16/presentation/ui/screen/add_product_screen.dart';
import 'package:flutter_batch16/presentation/ui/screen/edit_product_screen.dart';
import 'package:flutter_batch16/presentation/ui/screen/widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingButton(context),
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
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
          );
        },
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
