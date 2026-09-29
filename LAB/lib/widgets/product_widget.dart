import 'package:flutter/material.dart';
import '../models/product.dart';

/// ProductWidget: Hiển thị thông tin một sản phẩm theo yêu cầu của bài giảng
class ProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductWidget({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.Name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.salePrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '-${product.discountPercen.toStringAsFixed(0)}%',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
