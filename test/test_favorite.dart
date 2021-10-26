import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/imp/local_storage.dart';

void testFavorite() {
  final storage = LocalStorage();
  const album = 'some-album';
  storage.delete('favorites');
  final favoriteAgent = FavoriteSaver();
  test('Favorite album', () async {
    await favoriteAgent.favorite(album);
    expect(await storage.exists('favorites'), true);
    expect((await storage.load('favorites')).isNotEmpty, true);
    expect(await favoriteAgent.isFavorited(album), true);
    await favoriteAgent.unfavorite(album);
    expect((await storage.load('favorites')).isEmpty, true);
    expect(await favoriteAgent.isFavorited(album), false);
  });
}
