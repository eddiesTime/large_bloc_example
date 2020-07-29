import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/core/unknown_route_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unknown Route Page', () {
    setUp(() async {});

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: UnknownRoutePage()),
      );
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.text('ERROR 404 \npage not found'), findsOneWidget);
    });
  });
}
