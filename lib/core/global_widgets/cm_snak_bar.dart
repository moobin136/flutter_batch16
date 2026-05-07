import '../../export.dart';

void snackBar({
  required BuildContext context,
  bool isError = false,
  bool isTop = true,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(isError ? Icons.close : Icons.check_circle,
                color: isError ? Colors.white : Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(isError ? "Error" : "Successfully Completed!"),
            ),
          ],
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: isTop
            ? EdgeInsets.only(
                bottom: (MediaQuery.sizeOf(context).height - 125),
                left: 16,
                right: 16,
              )
            : const EdgeInsets.all(10),
        duration: const Duration(seconds: 3),
      ),
    );
