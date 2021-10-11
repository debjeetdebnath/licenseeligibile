import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier{
  String _eligibilityMessage = "";
  bool? _isEligible;

  void checkEligiblity(int age){
    if(age >= 18)
      eligibleForLicense();
    else
      notEligibleForLicense();
  }

  void eligibleForLicense(){
    _eligibilityMessage = "You are eligible to apply for Driving License";
    _isEligible = true;

    notifyListeners();
  }


  void notEligibleForLicense(){
    _eligibilityMessage = "You are not eligible to apply for Driving License";
    _isEligible = false;
    notifyListeners();
  }

  String get eligibilityMessage => _eligibilityMessage;

  bool? get isEligible => _isEligible;


}