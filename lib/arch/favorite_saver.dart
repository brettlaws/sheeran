import 'package:sheeran/arch/storage_interface.dart';
import 'package:sheeran/config.dart';

class FavoriteSaver {
  IStorage get storage => abstractFactory.storage;

  Future<void> favorite(String albumName) async {
    await storage.save(albumName, 'favorite');
  }

  Future<void> unfavorite(String albumName) async {
    await storage.delete(albumName);
  }

  Future<bool> isFavorited(String albumName) async {
    return await storage.load(albumName) == 'favorite';
  }
}
