import '../../../../export.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.productName,
    this.productCode,
    this.productQuantity,
    this.productPrice,
    this.onEdit,
    this.onDelete,
  });

  final String? productName;
  final String? productCode;
  final int? productQuantity;
  final double? productPrice;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      child: ListTile(
        title: Text('Product Name: $productName'),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Code: $productCode'),
            Text('Product Quantity: $productQuantity'),
            Text('Product Price: $productPrice'),
            Divider(color: Colors.grey[300], thickness: 1),
            Row(
              children: [
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    onEdit!();
                  },
                  label: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    onDelete!();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                    ),
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
