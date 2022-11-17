class CartEntity {
  final String? imageUrl;
  double? price;
  int? quantity;
  double? totalPrice;

  CartEntity(
      {required this.imageUrl, required this.price, required this.quantity})
      : totalPrice = price;
}
