import 'package:flutter_batch16/export.dart';

void customSnackBar(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(msg),
    ),
  );
}
