import 'package:flutter/material.dart';

class ValidateTools {
  bool validarTextFields(List<TextEditingController> controllers, {List<TextEditingController>? numberControllers, List<TextEditingController>? senhasControllers,}) {
    bool isControllerFilled = controllers.every(
      (tec) => tec.text.trim().isNotEmpty && tec.text.trim().length > 3,
    );

    if (numberControllers != null) {
      bool isNumberControllerFilled =numberControllers.every((tec) => tec.text.trim().isNotEmpty);

      if (senhasControllers != null){
        bool isSenhasControllerFilled = senhasControllers.every((tec) => tec.text.trim().length > 4);
        return isControllerFilled & isNumberControllerFilled && isSenhasControllerFilled;
      }

      return isControllerFilled && isNumberControllerFilled;
    }

    if (senhasControllers != null){
      bool isSenhasControllerFilled = senhasControllers.every((tec) => tec.text.trim().length >4);
      if (numberControllers != null){
        bool isNumberControllerFilled = numberControllers.every((tec) => tec.text.trim().isNotEmpty);
        return isControllerFilled && isNumberControllerFilled && isSenhasControllerFilled;
      }
      return isControllerFilled && isSenhasControllerFilled;
    }

    return isControllerFilled;
  }
}
