import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/arch/favorite_saver.dart';
import 'package:sheeran/imp/local_storage.dart';

void testFavorite() {
  const album = 'some-album';
  final storage = LocalStorage();
  storage.delete(album);
  final favoriteAgent = FavoriteSaver(storage: storage);
  test('Favorite album', () async {
    await favoriteAgent.favorite(album);
    expect(await storage.exists(album), true);
    expect(await storage.load(album) == 'favorite', true);
    await favoriteAgent.unfavorite(album);
    expect(await storage.exists(album), false);
  });
}
