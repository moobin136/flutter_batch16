import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
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

  int getProductQuantity() {
    final quantityText = _quantityController.text;
    if (quantityText.isEmpty) {
      return 0;
    }
    return int.tryParse(quantityText) ?? 0;
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
                  onPressed: () => _onTabSaveButton(),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabSaveButton() {
    if (_formKey.currentState!.validate()) {
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
