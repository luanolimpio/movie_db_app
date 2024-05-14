import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:micro_design_system/src/components/cards/ds_backdrop_card.dart';
import 'package:micro_design_system/src/components/utils/ds_key_enum.dart';

void main() {
  testWidgets(
    'Should return a DSBackdropCard with all parameters',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBackdropCard(
              posterPath:
                  'https://image.tmdb.org/t/p/w220_and_h330_face/wTS3dS2DJiMFFgqKDz5fxMTri.jpg',
              backdropPath:
                  'https://image.tmdb.org/t/p/w1920_and_h800_multi_faces/jlGmlFOcfo8n5tURmhC7YVd4Iyy.jpg',
              title: 'Suicide Squad',
              subtitle: '05 de agosto de 2021',
              tagline: 'How much can you know about yourself?',
              onTapBackButton: () {},
            ),
          ),
        ),
      );
      final backdrop = tester.firstWidget<Container>(find.byType(Container));
      final backButton = find.byType(IconButton);
      final posterCard = find.byKey(Key(DSKeyEnum.posterCard.name));
      final title = find.text('Suicide Squad');
      final subtitle = find.text('05 de agosto de 2021');
      final tagline = find.text('How much can you know about yourself?');

      expect((backdrop.decoration as BoxDecoration).image != null, true);
      expect(backButton, findsOneWidget);
      expect(posterCard, findsOneWidget);
      expect(title, findsOneWidget);
      expect(subtitle, findsOneWidget);
      expect(tagline, findsOneWidget);
    },
  );

  testWidgets(
    'Should return a DSBackdropCard with only required parameters',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSBackdropCard(
              title: 'Suicide Squad',
              tagline: '',
              onTapBackButton: () {},
            ),
          ),
        ),
      );
      final backdrop = tester.firstWidget<Container>(find.byType(Container));
      final backButton = find.byType(IconButton);
      final noImageCard = find.byKey(Key(DSKeyEnum.noImageCard.name));
      final text = find.byType(Text);

      expect((backdrop.decoration as BoxDecoration).image == null, true);
      expect(backButton, findsOneWidget);
      expect(noImageCard, findsOneWidget);
      expect(text, findsOneWidget);
    },
  );
}
