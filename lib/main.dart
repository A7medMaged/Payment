import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment/features/checkout/presentation/views/cart_veiw.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const CartVeiw(),
    );
  }
}
