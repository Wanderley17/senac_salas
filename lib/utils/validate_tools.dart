import 'package:flutter/material.dart';

class ValidateTools {
  bool validarTextFields(List<TextEditingController> controllers, {List<TextEditingController>? numberControllers,}) {
    bool isControllerFilled = controllers.every(
      (tec) => tec.text.trim().isNotEmpty && tec.text.trim().length > 3,
    );

    if (numberControllers != null) {
      bool isNumberControllerFilled =numberControllers.every((tec) => tec.text.trim().isNotEmpty);
      return isControllerFilled && isNumberControllerFilled;
    }

    return isControllerFilled;
  }
}
