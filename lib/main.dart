import 'package:fashion_kart/presentation/constants.dart';
import 'package:fashion_kart/presentation/provider/product_provider.dart';
import 'package:fashion_kart/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FashionKart',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Constants.backgroundColor,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
