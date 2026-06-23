import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContInfo extends StatelessWidget {
  const ContInfo({
    super.key,
    required this.labelText,
    required this.icon,
  });

  final String labelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16.w, color: const Color(0xff4a5568)),
            SizedBox(width: 8.w),
            Text(
              labelText,
              style: TextStyle(fontSize: 12.sp, color: const Color(0xff4a5568)),
            ),
          ],
        )
      ],
    );
  }
}
