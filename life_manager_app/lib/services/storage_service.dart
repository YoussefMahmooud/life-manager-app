import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveProgress({
    required int pagesRead,
    required int totalPages,
    required String lastRead,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('pagesRead', pagesRead);
    await prefs.setInt('totalPages', totalPages);
    await prefs.setString('lastRead', lastRead);
  }

  static Future<Map<String, dynamic>> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'pagesRead': prefs.getInt('pagesRead') ?? 0,
      'totalPages': prefs.getInt('totalPages') ?? 2,
      'lastRead': prefs.getString('lastRead') ?? "لم تبدأ بعد",
    };
  }
}