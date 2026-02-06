import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/catalog/domain/entities/product_entity/product_entity.dart';
import 'package:frontend/features/catalog/domain/usecases/product_use_cases.dart';
import 'package:frontend/features/catalog/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:frontend/features/catalog/presentation/widgets/product_card.dart';
import 'package:frontend/features/catalog/domain/repositories/product_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockStorage extends Mock implements Storage {}

void main() {
  late MockProductRepository mockRepository;
  late ProductUseCases productUseCases;
  late ProductBloc productBloc;
  late Storage storage;

  setUpAll(() {
    storage = MockStorage();
    when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenReturn(null);
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.clear()).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  setUp(() {
    mockRepository = MockProductRepository();
    productUseCases = ProductUseCases(repository: mockRepository);
    productBloc = ProductBloc(productUseCases: productUseCases);
  });

  tearDown(() {
    productBloc.close();
  });

  Widget createWidgetUnderTest(ProductEntity product) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<ProductBloc>.value(
          value: productBloc,
          child: ProductCard(product: product),
        ),
      ),
    );
  }

  group('ProductCard Widget', () {
    const tProductNormalStock = ProductEntity(
      id: 1,
      sku: 'SKU-001',
      name: 'Monitor 27" 4K',
      price: 350.00,
      currency: 'BOB',
      stock: 25,
      imageUrl: 'https://example.com/monitor.jpg',
    );

    const tProductLowStock = ProductEntity(
      id: 2,
      sku: 'SKU-002',
      name: 'Teclado Mecánico',
      price: 150.00,
      currency: 'USD',
      stock: 5,
      imageUrl: 'https://example.com/keyboard.jpg',
    );

    const tProductOutOfStock = ProductEntity(
      id: 3,
      sku: 'SKU-003',
      name: 'Mouse Inalámbrico',
      price: 50.00,
      currency: 'BOB',
      stock: 0,
      imageUrl: 'https://example.com/mouse.jpg',
    );

    testWidgets('should display product name and SKU', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.text('Monitor 27" 4K'), findsOneWidget);
      expect(find.text('SKU: SKU-001'), findsOneWidget);
    });

    testWidgets('should display product price with currency', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.text('BOB 350.00'), findsOneWidget);
    });

    testWidgets('should display stock count', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.text('25 Unidades'), findsOneWidget);
    });

    testWidgets('should NOT show warning for normal stock (>=10)', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.text('Stock bajo'), findsNothing);
      expect(find.text('Sin stock'), findsNothing);
    });

    testWidgets('should show "Stock bajo" warning for low stock (1-9)', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductLowStock));

      // Assert
      expect(find.text('Stock bajo'), findsOneWidget);
      expect(find.text('5 Unidades'), findsOneWidget);
    });

    testWidgets('should show "Sin stock" warning for zero stock', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductOutOfStock));

      // Assert
      expect(find.text('Sin stock'), findsOneWidget);
      expect(find.text('0 Unidades'), findsOneWidget);
    });

    testWidgets('should be tappable and open bottom sheet', (tester) async {
      // Arrange
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Act
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Assert - Bottom sheet should appear
      expect(find.text('Editar Precio'), findsOneWidget);
    });

    testWidgets('should display chevron icon', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('should display inventory icon in stock badge', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(createWidgetUnderTest(tProductNormalStock));

      // Assert
      expect(find.byIcon(Icons.inventory_2), findsOneWidget);
    });
  });
}
