import 'dart:math';

import 'package:ishop/src/business_logic/utils/extensions.dart';

class SimpleFunctions {
  SimpleFunctions();

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static Random _rnd = Random();

  static String? emailValidator(String? email) {
    if (email!.isValidEmail) {
      return null;
    } else {
      return 'Please enter a valid email id';
    }
  }

  static String? mobileNumberValidator(String? number) {
    if (number!.isValidPhone) {
      return null;
    } else {
      return 'Please enter a valid phone number';
    }
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter a valid name';
    } else {
      return null;
    }
  }

  static String? passWordValidator(String? passWord) {
    if (passWord == null || passWord.isEmpty || passWord.length != 6) {
      return 'Password is invalid';
    } else {
      return null;
    }
  }

  static String? addressValidator(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address must not be empty';
    } else {
      return null;
    }
  }

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
