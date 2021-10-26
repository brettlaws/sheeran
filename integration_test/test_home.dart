import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:sheeran/main.dart' as app;
import 'package:sheeran/main.dart';

void testHome() {
  testWidgets('Home page', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    expect(find.textContaining('Welcome to my app!'), findsOneWidget);
    expect(
        find.textContaining('Press "go" below to browse Ed Sheeran\'s Albums'),
        findsOneWidget);
    expect(find.byKey(const Key('Go button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Go button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('AlbumsPage')), findsOneWidget);
  });
}
