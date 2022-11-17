import 'package:fashion_kart/presentation/constants.dart';
import 'package:fashion_kart/presentation/provider/product_provider.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.data,
    required this.index
  }) : super(key: key);

  final ProductProvider data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  data.getCartList[index],
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Me Bandage Black Dress",
                          style: TextStyle(
                            fontSize: Constants.size12,
                            fontWeight: Constants.regularText,
                          ),
                        ),
                        Text(
                          "\$69.00",
                          style: TextStyle(
                            fontSize: Constants.size14,
                            fontWeight: Constants.boldText,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Size: S"),
                        Row(
                          children: [
                            const Text("Color"),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(4.0),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffAFBEC4),
                                ),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 8,
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            const Text("1"),
                            const SizedBox(
                              width: 14,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color(0xffAFBEC4),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 8,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 24,
          indent: 24,
          endIndent: 24,
          color: Color(0xffAFBEC4),
        )
      ],
    );
  }
}
