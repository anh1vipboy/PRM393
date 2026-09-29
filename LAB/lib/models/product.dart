class Product {
  final String id;
  // ignore: non_constant_identifier_names
  final String Name;
  final String description;
  final double price;
  final double discountPercen;
  final String image;
  final double rating;
  final int reviewsCount;

  Product({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.Name,
    required this.description,
    required this.price,
    required this.discountPercen,
    required this.image,
    this.rating = 4.8,
    this.reviewsCount = 120,
  });

  // Getter name hỗ trợ quy chuẩn đặt tên Dart
  String get name => Name;

  // Tính giá sau khi giảm: price * (1 - discountPercen / 100)
  double get salePrice => price * (1 - (discountPercen / 100));
}
