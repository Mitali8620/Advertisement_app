import 'package:flutter/material.dart';
import '../../utils/core/services/store_keys.dart';
import '../../utils/core/services/store_service.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _isDarkMode = false;
    loadFromPrefs();
  }

  void loadFromPrefs() async {
    final _mode = await StoreService().getData(key: StoreKeys.themeMode);
    _isDarkMode = _mode == 'true' ? true : false;
    notifyListeners();
  }

  void toggleTheme(bool themeMode) async {
    await StoreService()
        .setData(key: StoreKeys.themeMode, data: themeMode.toString());
    loadFromPrefs();
    notifyListeners();
  }
}
