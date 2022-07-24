import 'package:flutter/material.dart'
    show ChangeNotifier, TextEditingController;

class QRCodeGenerateProvider with ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController get getTextEditingController => textEditingController;

  set setTextEditingController(TextEditingController textEditingController) =>
      this.textEditingController = textEditingController;

  void reload() => notifyListeners();
}
