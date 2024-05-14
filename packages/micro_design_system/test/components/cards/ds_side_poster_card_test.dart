import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_design_system/src/components/cards/ds_side_poster_card.dart';
import 'package:micro_design_system/src/components/utils/ds_key_enum.dart';

void main() {
  testWidgets(
    'Should return a DSSidePosterCard with all parameters',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSidePosterCard(
              path:
                  'https://image.tmdb.org/t/p/w220_and_h330_face/wTS3dS2DJiMFFgqKDz5fxMTri.jpg',
              height: 141,
              width: 94,
              title: 'Suicide Squad',
              description: const [
                Text(
                  'Sinopse não informada',
                ),
              ],
              onTap: () {},
            ),
          ),
        ),
      );
      final cachedImage = find.byKey(Key(DSKeyEnum.cachedImage.name));
      final title = find.text('Suicide Squad');
      final description = find.text('Sinopse não informada');

      expect(cachedImage, findsOneWidget);
      expect(title, findsOneWidget);
      expect(description, findsOneWidget);
    },
  );

  testWidgets(
    'Should return a DSSidePosterCard without path and empty description',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSSidePosterCard(
              height: 141,
              width: 94,
              title: 'Suicide Squad',
              description: const [],
              onTap: () {},
            ),
          ),
        ),
      );

      final noImageCard = find.byKey(Key(DSKeyEnum.noImageCard.name));
      final columnWithoutDescription = find.descendant(
        of: find.byType(Column),
        matching: find.byType(Text),
      );
      expect(noImageCard, findsOneWidget);
      expect(columnWithoutDescription, findsOneWidget);
    },
  );
}
