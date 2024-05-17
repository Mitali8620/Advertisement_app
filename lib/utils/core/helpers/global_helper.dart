import 'package:flutter/material.dart';

import '../services/locator_service.dart';

class GlobalInit {
  static final navKey = GlobalKey<NavigatorState>();

  globalInitializer() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setUpLocator();
  }
}
