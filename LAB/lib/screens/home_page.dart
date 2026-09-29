import 'package:flutter/material.dart';
import '../data/product_dao.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/product_detail_widget.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Chỉ số điều hướng hiện tại: 0 = Product List, 1 = Product Detail, 2 = Cart
  int _currentIndex = 0;
  final ProductDAO _productDAO = ProductDAO();
  final TextEditingController _searchController = TextEditingController();

  List<Product> _filteredProducts = [];
  Product? _selectedProduct;

  // Danh sách các sản phẩm đang có trong giỏ hàng
  final List<CartItem> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadProducts() {
    final list = _productDAO.getAllProduct();
    setState(() {
      _filteredProducts = list;
      if (list.isNotEmpty && _selectedProduct == null) {
        _selectedProduct = list.first;
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredProducts = _productDAO.findProductByName(query);
    });
  }

  /// Khi người dùng nhấp vào một sản phẩm trong danh sách:
  /// Cập nhật sản phẩm được chọn và hoán đổi Container ở body sang màn hình Product Detail
  void _onProductSelected(Product product) {
    setState(() {
      _selectedProduct = product;
      _currentIndex = 1; // Chuyển sang Container chi tiết sản phẩm
    });
  }

  /// Thêm sản phẩm vào giỏ hàng thực tế
  void _addToCart(Product product) {
    setState(() {
      final existingIndex =
          _cartItems.indexWhere((item) => item.product.id == product.id);
      if (existingIndex >= 0) {
        _cartItems[existingIndex].quantity++;
      } else {
        _cartItems.add(CartItem(product: product, quantity: 1));
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added "${product.Name}" to cart!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'View Cart',
          textColor: Colors.amberAccent,
          onPressed: () {
            setState(() {
              _currentIndex = 2; // Mở thẳng sang Container Cart
            });
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// Xóa sản phẩm khỏi giỏ hàng
  void _removeFromCart(CartItem item) {
    setState(() {
      _cartItems.remove(item);
    });
  }

  /// Cập nhật số lượng sản phẩm (+1 hoặc -1)
  void _updateCartQuantity(CartItem item, int delta) {
    setState(() {
      item.quantity += delta;
      if (item.quantity <= 0) {
        _cartItems.remove(item);
      }
    });
  }

  // =========================================================================
  // CÁC CONTAINER ĐẠI DIỆN CHO TỪNG CỤM CHỨC NĂNG (THEO TƯ DUY CỦA BÀI GIẢNG)
  // =========================================================================

  /// 1. Container chứa cụm chức năng Danh sách sản phẩm (Product List)
  Widget _buildProductListContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8FAFC),
      child: Column(
        children: [
          // Thanh tìm kiếm Search products...
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 15,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFF94A3B8),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Danh sách sản phẩm hiển thị bằng ProductListWidget
          Expanded(
            child: ProductListWidget(
              products: _filteredProducts,
              onProductTap: _onProductSelected,
            ),
          ),
        ],
      ),
    );
  }

  /// 2. Container chứa cụm chức năng Chi tiết sản phẩm (Product Detail)
  Widget _buildProductDetailContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8FAFC),
      child: _selectedProduct != null
          ? ProductDetailWidget(
              product: _selectedProduct!,
              onTap: () => _addToCart(_selectedProduct!),
            )
          : const Center(
              child: Text(
                'Please select a product from Home',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }

  /// 3. Container chứa cụm chức năng Giỏ hàng (Cart) với đầy đủ dữ liệu thực tế
  Widget _buildCartContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8FAFC),
      child: CartPage(
        cartItems: _cartItems,
        onRemove: _removeFromCart,
        onUpdateQuantity: _updateCartQuantity,
        onShopNow: () {
          setState(() {
            _currentIndex = 0; // Quay về danh sách sản phẩm
          });
        },
      ),
    );
  }

  /// Phương thức chọn Container tương ứng để đưa vào thuộc tính body của HomePage
  Widget _getBodyContainer() {
    switch (_currentIndex) {
      case 0:
        return _buildProductListContainer();
      case 1:
        return _buildProductDetailContainer();
      case 2:
        return _buildCartContainer();
      default:
        return _buildProductListContainer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalCartQuantity =
        _cartItems.fold<int>(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E88E5),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // Nếu không ở trang chủ, hiển thị nút Back để quay về Container danh sách
        leading: _currentIndex != 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              )
            : null,
        title: Text(
          _currentIndex == 0
              ? 'Products'
              : (_currentIndex == 1 ? 'Product Detail' : 'Cart'),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      // Gán Container tương ứng vào thuộc tính body của Scaffold
      body: SafeArea(
        child: _getBodyContainer(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF1E88E5),
        unselectedItemColor: const Color(0xFF94A3B8),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.crop_square_rounded),
            label: 'Product Detail',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              isLabelVisible: totalCartQuantity > 0,
              label: Text('$totalCartQuantity'),
              child: const Icon(Icons.shopping_cart_rounded),
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
