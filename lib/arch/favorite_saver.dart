import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/config.dart';

class FavoriteSaver {
  IStorage get storage => abstractFactory.storage;

  Future<void> favorite(String albumName) async {
    final favorites = await storage.load('favorites');
    if (favorites.contains(albumName) == false) {
      favorites.add(albumName);
    }
    await storage.save('favorites', favorites);
  }

  Future<void> unfavorite(String albumName) async {
    final favorites = await storage.load('favorites');
    if (favorites.contains(albumName)) {
      favorites.remove(albumName);
    }
    await storage.save('favorites', favorites);
  }

  Future<bool> isFavorited(String albumName) async {
    final favorites = await storage.load('favorites');
    return favorites.contains(albumName);
  }
}
