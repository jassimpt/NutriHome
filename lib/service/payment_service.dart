import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  late Razorpay razorpay;
  late Completer<String> _paymentStatusCompleter;

  PaymentService() {
    _paymentStatusCompleter = Completer<String>();
    initialize();
  }

  Future<String> openCheckOut({required int amount}) async {
    var options = {
      "key": "rzp_test_gHlHVIOJ6S5KQ4",
      "amount": amount * 100,
      "name": "Nutrihome",
      "prefill": {"contact": "9961666937", "email": "jassimmuthu990@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
      return _paymentStatusCompleter.future;
    } catch (e) {
      throw Exception(e);
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Success: ${response.paymentId}");
    _paymentStatusCompleter.complete("Success");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed: ${response.message}");
    if (!_paymentStatusCompleter.isCompleted) {
      _paymentStatusCompleter.complete("Failed");
    }
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "external wallet: ${response.walletName}");
  }

  void initialize() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }
}
