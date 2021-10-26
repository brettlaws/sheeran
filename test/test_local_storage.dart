import 'package:flutter_test/flutter_test.dart';
import 'package:sheeran/config.dart';

void testLocalStorage() {
  final storage = abstractFactory.storage;

  test('Volatile storage', () async {
    await storage.delete('key');
    expect(await storage.exists('key'), false);
    expect(await storage.load('key'), []);
    await storage.save('key', ['value']);
    expect(await storage.exists('key'), true);
    expect(await storage.load('key'), ['value']);
    await storage.delete('key');
  });
}
