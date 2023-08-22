import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stripe_sdk_with_ui/stripe_sdk.dart';
import 'package:stripe_sdk_with_ui/stripe_sdk_ui.dart';

const _stripePublishableKey = 'pk_test_FlC2pf2JCTgKLcgG0aScSQmp00XqfTJL8s';
const _returnUrl = 'stripesdk://demo.stripesdk.ezet.io';
const _returnUrlWeb = 'http://demo.stripesdk.ezet.io';

String getScaReturnUrl() {
  return kIsWeb ? _returnUrlWeb : _returnUrl;
}

void main() async {
  Stripe.init(_stripePublishableKey, returnUrlForSca: getScaReturnUrl());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
        title: 'Stripe SDK Demo',
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        },
        routes: {
          '/': (context) => HomeScreen(),
        },
        initialRoute: '/',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    );
    return ChangeNotifierProvider(create: (_) => PaymentMethodStore(), child: app);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe SDK Demo'),
      ),
      body: ListView(children: <Widget>[
      ]),
    );
  }
}
