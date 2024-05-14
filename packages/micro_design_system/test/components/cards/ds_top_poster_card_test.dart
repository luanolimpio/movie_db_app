import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_design_system/src/components/cards/ds_top_poster_card.dart';
import 'package:micro_design_system/src/components/utils/ds_key_enum.dart';

void main() {
  testWidgets(
    'Should return a DSTopPosterCard with all parameters',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTopPosterCard(
              path: 'https://image.tmdb.org/t/p/w235_and_h235_face/5PscK9HNXGFQMIxkpbR8ObB7vuR.jpg',
              height: 200,
              title: 'Ella Purnell',
              description: 'Descrição não informada',
              onTap: () {},
            ),
          ),
        ),
      );
      final cachedImage = find.byKey(Key(DSKeyEnum.cachedImage.name));
      final title = find.text('Ella Purnell');
      final description = find.text('Descrição não informada');

      expect(cachedImage, findsOneWidget);
      expect(title, findsOneWidget);
      expect(description, findsOneWidget);
    },
  );

  testWidgets(
    'Should return a DSTopPosterCard without path',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTopPosterCard(
              title: 'Ella Purnell',
              description: 'Descrição não informada',
              onTap: () {},
            ),
          ),
        ),
      );

      final noImageCard = find.byKey(Key(DSKeyEnum.noImageCard.name));
      final title = find.text('Ella Purnell');
      final description = find.text('Descrição não informada');

      expect(noImageCard, findsOneWidget);
      expect(title, findsOneWidget);
      expect(description, findsOneWidget);
    },
  );
}
