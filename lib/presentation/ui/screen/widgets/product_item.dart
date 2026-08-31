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
    this.imageLink =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTptiPMNaFbvYIxmIbWOqHC2g52am1Zrvchbxhof2cz6Q&s=10',
    this.productUnitPrice = 0,
    this.total = 00,
  });

  final String? productName;
  final String? productCode;
  final int? productQuantity;
  final int? productUnitPrice;
  final double? total;
  final double? productPrice;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(imageLink!),
            Align(
              alignment: AlignmentGeometry.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      productName ?? 'null',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Product Code : $productCode',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Qut : $productQuantity',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Price : $productPrice',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Unit Price : $productUnitPrice',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      'Total : $total',
                      style: const TextStyle(
                        fontSize: 14,
                        // fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: onEdit,
                      label: const Text('Edit'),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: onDelete,
                      label: const Text('Deleted'),
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
