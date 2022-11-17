import 'package:fashion_kart/presentation/constants.dart';
import 'package:fashion_kart/presentation/provider/product_provider.dart';
import 'package:fashion_kart/presentation/widgets/custom_navbar.dart';
import 'package:fashion_kart/presentation/widgets/gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    final data = Provider.of<ProductProvider>(context, listen: false);
    data.getProductEntity();
    data.checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: data.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 27.29,
                        right: 27.29,
                        top: 58,
                      ),
                      child: HomeHeader(),
                    ),
                    const SizedBox(
                      height: 35.29,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        "New Arrivals",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: Constants.boldText,
                          fontSize: Constants.size14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 19.0),
                      child: CustomGridview(data: data),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

