import 'package:fashion_kart/presentation/constants.dart';
import 'package:fashion_kart/presentation/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    final data = Provider.of<ProductProvider>(context, listen: false);
    data.getProductEntity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56.0, bottom: 72.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(
                      width: 112.25,
                    ),
                    const Text(
                      "Your Cart",
                      style: TextStyle(
                          fontSize: Constants.size16,
                          fontWeight: Constants.boldText),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.getCartList.length,
                  itemBuilder: (context, index) {
                    return CartTile(data: data, index: index,);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total Price"),
                  Text("\$ 215"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

