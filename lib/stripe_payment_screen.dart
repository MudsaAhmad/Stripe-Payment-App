import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment_integration/payment_provider.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StripePaymentProvider>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      await value.makePayment();
                    },
                    child: const Text('Pay Now!!'))
              ],
            ),
          );
        },
      ),
    );
  }
}
