import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment_integration/payment_provider.dart';
import 'package:stripe_payment_integration/stripe_payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeStripe();
  runApp(const MyApp());
}

Future<void> initializeStripe() async {
  Stripe.publishableKey =
      "pk_test_51ORvfgKVlAPqjgHvE74plrx6X8tL9OaqUEntKfZiS7hCzFn69emue1lvR4S7qS3bvcEpi2KvwLWpVX4STcxlsgBr007E76FbyK";
  await Stripe.instance.applySettings();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StripePaymentProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StripePaymentScreen(),
      ),
    );
  }
}
