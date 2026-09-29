import 'package:flutter_test/flutter_test.dart';
import 'package:lab/data/product_dao.dart';
import 'package:lab/main.dart';

void main() {
  test('ProductDAO getAllProduct and findProductByName test', () {
    final dao = ProductDAO();
    final allProducts = dao.getAllProduct();
    expect(allProducts.isNotEmpty, true);

    // Test findProductByName
    final iphones = dao.findProductByName('iPhone');
    expect(iphones.length, 1);
    expect(iphones.first.Name, 'iPhone 15');

    // Test not found
    final notFound = dao.findProductByName('xyznonexistent');
    expect(notFound.isEmpty, true);
  });

  testWidgets('App renders Home Page and products smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify AppBar title
    expect(find.text('Products'), findsOneWidget);

    // Verify Search Bar hint
    expect(find.text('Search products...'), findsOneWidget);

    // Verify Product Name
    expect(find.text('iPhone 15'), findsOneWidget);
  });
}
