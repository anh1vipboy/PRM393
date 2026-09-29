import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_card_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product>? onProductTap;

  const ProductListWidget({
    super.key,
    required this.products,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    // Nếu chưa có sản phẩm nào, hiển thị thông báo "No products found"
    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 72,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 14),
            const Text(
              'No products found',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    // Xử lý responsive theo kích thước widget cha chứa sản phẩm:
    // Khi chiều rộng <= 500 và thẳng đứng thì 1 cột, nằm ngang thì 2 cột
    // Khi chiều rộng >= 500 và thẳng đứng thì 2 cột, nằm ngang thì 3 cột
    return LayoutBuilder(
      builder: (context, constraints) {
        final orientation = MediaQuery.of(context).orientation;
        final isPortrait = orientation == Orientation.portrait;
        final parentWidth = constraints.maxWidth;

        int columns;
        if (parentWidth <= 500) {
          columns = isPortrait ? 1 : 2;
        } else {
          columns = isPortrait ? 2 : 3;
        }

        // Khi 1 cột: Sử dụng ListView.builder theo hướng dẫn của cô
        if (columns == 1) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCardWidget(
                product: product,
                onTap: () => onProductTap?.call(product),
              );
            },
          );
        }

        // Khi từ 2 cột trở lên: Sử dụng GridView.builder
        // Chiều rộng mỗi cột tùy biến theo kích thước widget cha chứa sản phẩm
        final horizontalPadding = 32.0;
        final totalSpacing = (columns - 1) * 10.0;
        final columnWidth = (parentWidth - horizontalPadding - totalSpacing) / columns;
        const cardHeight = 102.0;
        final childAspectRatio = (columnWidth / cardHeight).clamp(1.8, 3.5);

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCardWidget(
              product: product,
              margin: EdgeInsets.zero,
              onTap: () => onProductTap?.call(product),
            );
          },
        );
      },
    );
  }
}
