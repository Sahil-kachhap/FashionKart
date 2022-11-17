import 'package:flutter/material.dart';
import '../constants.dart';
import '../provider/product_provider.dart';

class CustomGridview extends StatefulWidget {

  const CustomGridview({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductProvider data;

  @override
  State<CustomGridview> createState() => _CustomGridviewState();
}

class _CustomGridviewState extends State<CustomGridview> {
  bool toggleCartIcon = false;
  List<bool>? addedList = [];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: widget.data.getProductList.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 13.0,
          crossAxisSpacing: 13.0,
          childAspectRatio: 0.61,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          List<String> words = widget.data.getProductList[index].title!.split(" ");
          String productTitle = words[0];
          double price = widget.data.getProductList[index].price!;
          
          addedList!.add(false);

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.data.getProductList[index].image!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 13.0, bottom: 12.0, right: 8.31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productTitle,
                        style: const TextStyle(
                          fontSize: Constants.size10,
                          fontWeight: Constants.regularText,
                          color: Constants.productTitleColor,
                        ),
                      ),
                      const Text(
                        "Me Bandage Dress",
                        style: TextStyle(
                          fontSize: Constants.size12,
                          fontWeight: Constants.regularText,
                          color: Constants.productDescriptionColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            "\$ $price",
                            style: const TextStyle(
                              fontSize: Constants.size16,
                              fontWeight: Constants.boldText,
                            ),
                          ),
                          GestureDetector(
                            child: addedList!.elementAt(index) ? const Icon(Icons.shopping_bag): const ImageIcon(
                                    AssetImage("assets/bag.png"),
                            ),
                            onTap: (){
                              setState(() {
                                addedList![index] = addedList![index] == false ? true : false;
                              });
                              widget.data.addToCart(widget.data.getProductList[index].image!);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
