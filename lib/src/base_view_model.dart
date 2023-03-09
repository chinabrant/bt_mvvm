import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (isDisposed) {
      return;
    }

    super.notifyListeners();
  }
}
