import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibleMessage = "";
  void checkEligiblity(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibleMessage = 'you are eligible';
      notifyListeners();
    } else {
      isEligible = false;
      eligibleMessage = 'you are not eligible';
      notifyListeners();
    }
  }

  String? validationMessage = "";
  void checkVolidation(String email) {
    if (email.contains("@gmail.com")) {
      validationMessage = '';
      notifyListeners();
    } else {
      validationMessage = 'please enter vaild email';
      notifyListeners();
    }
  }
}
