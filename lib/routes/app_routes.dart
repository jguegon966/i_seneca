import 'package:flutter/material.dart';
import 'package:i_seneca/models/menu_options.dart';
import 'package:i_seneca/screens/second_screen.dart';

import '../screens/login_screen.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      'login': (BuildContext context) => const LoginScreen(),
    });

    return appRoutes;
  }
}
