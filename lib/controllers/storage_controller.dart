import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class StorageController {
  final box = GetStorage();

  Future<void> saveData(final String key, final data) async {
    await box.write(key, data);
  }

  String? getData(final String key) {
    try {
      return box.read(key);
    } catch (e) {
      if (kDebugMode) {
        print("Error storage GetData $e");
      }
      return null;
    }
  }

  Future<void> clearStorage() async {
    return await box.erase();
  }
}
