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
    this.imageLink,
    this.productUnitPrice = 0,
    this.total = 0,
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
      margin: EdgeInsets.zero,
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= IMAGE =================
            SizedBox(
              width: double.infinity,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: imageLink == null || imageLink!.trim().isEmpty
                    ? _buildNoImage()
                    : Image.network(
                  imageLink!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildNoImage();
                  },
                  loadingBuilder:
                      (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 6),

            // ================= PRODUCT NAME =================
            Text(
              productName ?? 'No Name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 3),

            // ================= PRODUCT DETAILS =================
            _productInfo(
              'Product Code',
              productCode ?? 'N/A',
            ),

            _productInfo(
              'Qty',
              '${productQuantity ?? 0}',
            ),

            _productInfo(
              'Price',
              '${productPrice ?? 0}',
            ),

            _productInfo(
              'Unit Price',
              '${productUnitPrice ?? 0}',
            ),

            _productInfo(
              'Total',
              '${total ?? 0}',
            ),

            const Spacer(),

            // ================= BUTTONS =================
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                    color: Colors.green,
                  ),
                  label: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                    ),
                  ),
                ),

                TextButton.icon(
                  onPressed: onDelete,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: Colors.red,
                  ),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
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

  // ================= NO IMAGE =================

  Widget _buildNoImage() {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 45,
          color: Colors.grey,
        ),
      ),
    );
  }

  // ================= PRODUCT INFO =================

  Widget _productInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        '$title : $value',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black87,
        ),
      ),
    );
  }
}