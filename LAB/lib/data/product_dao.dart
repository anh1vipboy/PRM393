import '../models/product.dart';

class ProductDAO {
  // Danh sách sản phẩm mẫu theo đúng thiết kế bài học
  static final List<Product> _productList = [
    Product(
      id: '1',
      Name: 'iPhone 15',
      description:
          'Experience the latest technology with the new iPhone 15. Stunning design, powerful performance, advanced dual-camera system, and all-day battery life.',
      price: 1099,
      discountPercen: 9,
      image:
          'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=600&auto=format&fit=crop&q=80',
      rating: 4.8,
      reviewsCount: 120,
    ),
    Product(
      id: '2',
      Name: 'Samsung S24',
      description:
          'Meet Galaxy S24 Ultra, the ultimate form of Galaxy Ultra with a new titanium exterior and a 6.8-inch flat display. Packed with Galaxy AI.',
      price: 999,
      discountPercen: 10,
      image:
          'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=600&auto=format&fit=crop&q=80',
      rating: 4.7,
      reviewsCount: 95,
    ),
    Product(
      id: '3',
      Name: 'MacBook Air',
      description:
          'Supercharged by M3 chip. Strikingly thin and fast, MacBook Air sails through work and play with up to 18 hours of battery life.',
      price: 1299,
      discountPercen: 7,
      image:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80',
      rating: 4.9,
      reviewsCount: 215,
    ),
    Product(
      id: '4',
      Name: 'iPad Pro',
      description:
          'The ultimate iPad experience with the groundbreaking M4 chip, groundbreaking Ultra Retina XDR display, and superfast wireless connectivity.',
      price: 1199,
      discountPercen: 8,
      image:
          'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600&auto=format&fit=crop&q=80',
      rating: 4.8,
      reviewsCount: 88,
    ),
    Product(
      id: '5',
      Name: 'Apple Watch Series 9',
      description:
          'Powerful sensors for health and fitness, innovative Double Tap gesture, and carbon neutral combinations.',
      price: 499,
      discountPercen: 12,
      image:
          'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=600&auto=format&fit=crop&q=80',
      rating: 4.6,
      reviewsCount: 142,
    ),
    Product(
      id: '6',
      Name: 'Sony WH-1000XM5',
      description:
          'Industry-leading noise cancelling with two processors and eight microphones for unprecedented sound quality and crystal-clear hands-free calling.',
      price: 399,
      discountPercen: 15,
      image:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80',
      rating: 4.9,
      reviewsCount: 310,
    ),
  ];

  /// Phương thức lấy toàn bộ danh sách sản phẩm
  List<Product> getAllProduct() {
    return List.from(_productList);
  }

  /// Phương thức tìm kiếm sản phẩm theo tên
  List<Product> findProductByName(String name) {
    if (name.trim().isEmpty) {
      return getAllProduct();
    }
    final query = name.toLowerCase().trim();
    return _productList
        .where((product) => product.Name.toLowerCase().contains(query))
        .toList();
  }
}
