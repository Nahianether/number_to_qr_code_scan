import 'package:flutter/widgets.dart';
import '../../screens/screen1/screen1.dart';
import '../../screens/screen2/screen2.dart';

import '../../helpers/routes/custom_routes.dart';

class BottomNavBarProvider {
  static Screens selected = Screens.one;

  static Widget _screen() {
    switch (selected) {
      case Screens.one:
        return const Screen1();
      case Screens.two:
        return const Screen2();
      default:
        return const Screen1();
    }
  }

  static Widget get screen => _screen();

  static Future<void> select(
      {required BuildContext context, required Screens value}) async {
    selected = value;
    await Navigator.pushReplacement(
      context,
      FadeRoute(page: screen),
    );
  }
}

enum Screens { one, two, three, four, five }
