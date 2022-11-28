import 'package:flutter/material.dart';
import 'package:project_app_eateso/pages/Payment/payment_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? paymentMethod;
  @override
  void initState() {
    super.initState();
    PaymentService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '10/',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              child: Text("Add a payment method"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40),
              ),
              onPressed: () async {
                paymentMethod = await PaymentService().createPaymentMethod();
                print(paymentMethod!.id);
              },
            ),
          ),
          Center(
              child: ElevatedButton(
            child: Text("Complete Payment Now"),
            style: ElevatedButton.styleFrom(fixedSize: Size(200, 40)),
            onPressed: () {
              print(paymentMethod!.id);
              PaymentService().processPayment(paymentMethod!);
            },
          ))
        ]));
  }
}
