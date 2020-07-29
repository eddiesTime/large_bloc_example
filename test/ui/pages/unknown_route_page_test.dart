import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unkown Route Page', () {
    setUp(() async {});

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text(
                'ERROR 404 \npage not found',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text('ERROR 404 \npage not found'), findsOneWidget);
    });
  });
}
