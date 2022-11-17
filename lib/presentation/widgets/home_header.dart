import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        child: const ImageIcon(
          AssetImage("assets/drawer.png"),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: const ImageIcon(
          AssetImage("assets/search.png"),
        ),
        onTap: () {},
      ),
    ]);
  }
}