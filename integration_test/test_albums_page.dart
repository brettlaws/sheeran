import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/config.dart';
import 'package:sheeran/main.dart';

void testAlbumsPage() {
  testWidgets('Albums page', (tester) async {
    await abstractFactory.storage.save('favorites', []);
    final fs = FavoriteSaver();
    await fs.unfavorite('+');
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Go button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Album list')), findsOneWidget);
    expect(find.byIcon(Icons.thumb_up), findsWidgets);
    await tester.tap(find.byKey(const Key('Fav-+')));
    await Future.delayed(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();
    expect(find.text('Ed Sheeran albums liked: 1'), findsOneWidget);
    expect(await fs.isFavorited('+'), true);
    await tester.tap(find.byKey(const Key('Fav-+')));
    await Future.delayed(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();
    expect(await fs.isFavorited('+'), false);
    expect(find.text('Ed Sheeran albums liked: 0'), findsOneWidget);
  });
}
