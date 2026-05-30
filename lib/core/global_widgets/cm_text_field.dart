import 'dart:ffi';

import 'package:flutter_batch16/export.dart';

class CmTextField extends StatelessWidget {
  const CmTextField({
    super.key,
    required this.titleText,
    required this.hintText,
    this.child,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  final String titleText;
  final String hintText;
  final Widget? child;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black26,
        width: 0.8,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white60,
            filled: true,
            hintText: hintText,
            suffixIcon: child,
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red)),
          ),
          obscureText: obscureText,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
