import 'package:flutter/material.dart';

import 'cm_text.dart';

class TaskCardCommon extends StatelessWidget {
  const TaskCardCommon({
    super.key,
    required this.title,
    required this.subTitle,
    required this.dateTime,
    this.onTapDelete,
    this.onTapEdit,
    required this.status,
    required this.color,
  });

  final String title;
  final Color color;
  final String status;
  final String subTitle;
  final DateTime dateTime;
  final VoidCallback? onTapEdit;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fSiz: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 6),
            CustomText(
              text: subTitle,
              maxLines: 2,
              fSiz: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: dateTime.toString(),
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 3.5),
                    child: Center(
                      child: FittedBox(
                        child: CustomText(
                          text: status,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onTapEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(width: 2),
                IconButton(
                  onPressed: onTapDelete,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
