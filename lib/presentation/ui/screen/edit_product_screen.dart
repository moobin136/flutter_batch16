import 'package:flutter_batch16/export.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.product,
  });

  final Data product;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.product.productName ?? '';
    _codeController.text = widget.product.productCode?.toString() ?? '';
    _quantityController.text = widget.product.qty?.toString() ?? '';
    _priceController.text = widget.product.totalPrice?.toString() ?? '';
    _unitPriceController.text = widget.product.unitPrice?.toString() ?? '';
    _imageLinkController.text = widget.product.img ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _unitPriceController.dispose();
    _imageLinkController.dispose();

    super.dispose();
  }

  Future<void> _updateProduct() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please fill in all fields.',
          ),
        ),
      );

      return;
    }

    setState(() {
      _isLoading = true;
    });

    final ProductController productController = ProductController();

    final Data updatedProduct = Data(
      id: widget.product.id,
      productName: _nameController.text.trim(),
      productCode: int.tryParse(_codeController.text.trim()),
      img: _imageLinkController.text.trim(),
      qty: int.tryParse(_quantityController.text.trim()),
      unitPrice: int.tryParse(_unitPriceController.text.trim()),
      totalPrice: int.tryParse(_priceController.text.trim()),
    );

    final bool success = await productController.updateProduct(updatedProduct);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Product updated successfully!',
          ),
        ),
      );

      // List screen-এ ফিরে যাবে
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Failed to update product!',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ================= PRODUCT NAME =================

                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                  ),
                  validator: _validateNotEmpty,
                ),

                // ================= PRODUCT CODE =================

                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Product Code',
                  ),
                  validator: _validateNotEmpty,
                ),

                // ================= QUANTITY =================

                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Product Quantity',
                  ),
                  validator: _validateNotEmpty,
                ),

                // ================= TOTAL PRICE =================

                TextFormField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Product Total Price',
                  ),
                  validator: _validateNotEmpty,
                ),

                // ================= UNIT PRICE =================

                TextFormField(
                  controller: _unitPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Unit Price',
                  ),
                  validator: _validateNotEmpty,
                ),

                // ================= IMAGE =================

                TextFormField(
                  controller: _imageLinkController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                  ),
                  validator: _validateNotEmpty,
                ),

                const SizedBox(height: 25),

                // ================= UPDATE BUTTON =================

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _isLoading ? null : _updateProduct,
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Update Product',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class EditProductScreen extends StatefulWidget {
//   const EditProductScreen({super.key});
//
//   @override
//   State<EditProductScreen> createState() => _EditProductScreenState();
// }
//
// class _EditProductScreenState extends State<EditProductScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _codeController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String? _validateNotEmpty(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'This field cannot be empty';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Update Product Screen',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Product Name',
//                   errorText: 'This field cannot be empty',
//                 ),
//                 validator: _validateNotEmpty,
//               ),
//               TextFormField(
//                 controller: _codeController,
//                 decoration: const InputDecoration(
//                   labelText: 'Product Code',
//                   errorText: 'This field cannot be empty',
//                 ),
//                 validator: _validateNotEmpty,
//               ),
//               TextFormField(
//                 controller: _quantityController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'Product Quantity',
//                   errorText: 'This field cannot be empty',
//                 ),
//                 validator: _validateNotEmpty,
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   labelText: 'Product Price',
//                   errorText: 'This field cannot be empty',
//                 ),
//                 validator: _validateNotEmpty,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text('Update Product'),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           backgroundColor: Colors.green,
//                           content: Text(
//                             'Product updated successfully!',
//                           ),
//                         ),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           backgroundColor: Colors.red,
//                           content: Text(
//                             'Please fill in all fields.',
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
