import 'package:sheeran/arch/storage_interface.dart';

class FavoriteSaver {
  FavoriteSaver({required this.storage});

  final IStorage storage;

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
