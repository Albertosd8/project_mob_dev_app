import 'dart:convert';

import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  final int amount;
  final String url;

  PaymentService({
    this.amount = 10000,
    this.url =
        'https://us-central1-project-mob-49634.cloudfunctions.net/StripePI',
  });

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51M7AFpEKrLgVsqtODY3VyAwn8oFMVoLotEMR8VRI5sHmqhw43A9uSqaoaDq93aPFEidSwdULxzHCpzfAdQmAMjHk00OvrSmjVU',
        androidPayMode: 'test',
        merchantId: 'test'));
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print('The transaction amount to be charged is $amount');
    PaymentMethod paymentMethod =
        await StripePayment.paymentRequestWithCardForm(
            CardFormPaymentRequest());
    return paymentMethod;
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {
    final http.Response response = await http.post(
      Uri.parse('$url?amount=$amount&currency=USD&paym=${paymentMethod.id}'),
    );

    if (response.body != 'error') {
      final paymentIntent = json.decode(response.body);
      final status = paymentIntent['paymentIntent']['status'];

      if (status == 'succeed') {
        print('Payment is being completed');
      }
    } else {
      print('Payment failed');
    }
  }
}
