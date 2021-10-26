import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/main.dart';

void testAlbumsPage() {
  testWidgets('Albums page', (tester) async {
    final fs = FavoriteSaver();
    await fs.unfavorite('album-A');
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Go button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Album list')), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsWidgets);
    await tester.tap(find.byKey(const Key('Fav-album-A')));
    await tester.pumpAndSettle();
    expect(await fs.isFavorited('album-A'), true);
    await tester.tap(find.byKey(const Key('Fav-album-A')));
    await tester.pumpAndSettle();
    expect(await fs.isFavorited('album-A'), false);
  });
}
