import 'package:flutter/material.dart';
import 'package:flutter_batch16/controller/product_controller.dart';
import 'package:flutter_batch16/model/product_model.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageLinkController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }



  @override
  dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  double getProductPrice() {
    final priceText = _priceController.text;
    if (priceText.isEmpty) {
      return 0.0;
    }
    return double.tryParse(priceText) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: _validateNotEmpty,
                controller: _nameController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Product Name',
                ),
              ),
              TextFormField(
                validator: _validateNotEmpty,
                controller: _imageLinkController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Image link',
                ),
              ),
              TextFormField(
                validator: _validateNotEmpty,
                controller: _codeController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Product Code',
                ),
              ),
              TextFormField(
                validator: _validateNotEmpty,
                controller: _quantityController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Product Quantity',
                ),
              ),
              TextFormField(
                validator: _validateNotEmpty,
                controller: _priceController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Product Price',
                ),
              ),
              TextFormField(
                validator: _validateNotEmpty,
                controller: _unitPriceController,
                decoration: const InputDecoration(
                  errorText: 'This field cannot be empty',
                  labelText: 'Unit Price',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: const Size.fromHeight(50),
                    foregroundColor: Colors.white,
                    alignment: Alignment.center,
                  ),
                  onPressed: () => _onTabSaveButton(Data()),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTabSaveButton(Data data) async {
    if (_formKey.currentState!.validate()) {
      ProductController productController = ProductController();

      await productController.createProduct(
        Data(
          img: _imageLinkController.text,
          productCode: int.tryParse(_codeController.text) ?? 0,
          productName: _nameController.text,
          totalPrice: int.tryParse(_priceController.text) ?? 0,
          qty: int.tryParse(_quantityController.text) ?? 0,
          unitPrice: int.tryParse(_unitPriceController.text) ?? 0,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Align(
            alignment: Alignment.center,
            child: Text(
              'Product added successfully',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
