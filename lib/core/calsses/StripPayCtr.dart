import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PayCtr extends GetxController {
  var paymentIntent;
  bool isPaymentMade = false;

  Future<bool> makePayment(double amount, currency) async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent = await createPaymentIntent(amount, currency);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Ikay'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      return displayPaymentSheet();
    } catch (err) {
      throw Exception(err);
    }
  }

  createPaymentIntent(double amount, String currency) async {
    Map<String, String> headers = {
      'Authorization':
          'Bearer sk_test_51O09zbEsScftBXSE9GQnV9zeu9Ufdhk1U91Brc79l5r2VAAkyh6k4j23zaFSbRiuja28i3nK8YZJYYVHli9vB8pi006cfIP3Dv',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': currency,
    };

    try {
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: headers);
      return jsonDecode(response.body);
    } catch (e) {
      Exception('Create Pay Intent => Failure');
    }
  }

  Future<bool> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        isPaymentMade = true;
        Get.defaultDialog(content: const Text("Payment Successful!"));
        paymentIntent = null;
      });
      return true;
    } on StripeException catch (e) {
      if (e.error.localizedMessage == 'The payment flow has been canceled') {
        // Handle canceled payment
        print('Payment canceled by the user');
        Get.defaultDialog(content: const Text("Payment Canceled!"));

        // You can show a message to the user or navigate back to the previous screen
      } else {
        // Handle other errors
        print('Error during payment: $e');
        // You might want to show a generic error message or log the error for debugging
      }
    } catch (e) {
      print('$e');
    }
    return false;
  }

  String calculateAmount(double amount) {
    return (amount * 100).toInt().toString();
  }
}
