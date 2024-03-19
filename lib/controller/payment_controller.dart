import 'package:flutter/material.dart';

class PaymentController extends ChangeNotifier {
  String? paymentmethod = "Razorpay";
  String? paymentmodelogo = "assets/icons/razorpay.jpeg";

  void paymentModeChanger(
      {required String method, required String methodlogo}) {
    paymentmethod = method;
    paymentmodelogo = methodlogo;
    notifyListeners();
  }
}
