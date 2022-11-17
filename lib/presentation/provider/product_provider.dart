import 'dart:developer';
import 'package:fashion_kart/data/repository/product_repository.dart';
import 'package:fashion_kart/domain/entity/cart_entity.dart';
import 'package:fashion_kart/domain/entity/product_entity.dart';
import 'package:fashion_kart/domain/usecase/check_internet_connection.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductEntity>? _productList = [];
  final List<CartEntity> _cartList = [];
  final InternetConnection connection = InternetConnection();

  List<ProductEntity> get getProductList => _productList!;
  List<CartEntity> get getCartList => _cartList;

  bool isLoading = false;
  double totalPrice = 0;

  checkConnection() {
    connection.checkConnectivity();
  }

  incrementItemCounter(CartEntity entity) {
    int index = _cartList.indexOf(entity);
    CartEntity item = CartEntity(
        imageUrl: entity.imageUrl,
        price: entity.price,
        quantity: entity.quantity! + 1);
    item.totalPrice = item.price! * item.quantity!;
    totalPrice += item.totalPrice!;
    _cartList[index] = item;
    notifyListeners();
  }

  decrementItemCounter(CartEntity entity) {
    int index = _cartList.indexOf(entity);
    if (entity.quantity! > 0) {
      CartEntity item = CartEntity(
          imageUrl: entity.imageUrl,
          price: entity.price,
          quantity: entity.quantity! - 1);
      item.totalPrice = item.price! * item.quantity!;
      totalPrice += item.totalPrice!;
      _cartList[index] = item;
      notifyListeners();
    }
  }

  addToCart(CartEntity item) {
    var exists = _cartList.where((element) => element.imageUrl == item.imageUrl);
    if (exists.isEmpty) {
      totalPrice += item.totalPrice!;
      _cartList.add(item);
      notifyListeners();
    } else {
      removeFromCart(item);
    }
  }

  removeFromCart(CartEntity item) {
    totalPrice -= item.totalPrice!;
    _cartList.removeWhere((element) => element.imageUrl == item.imageUrl);
    notifyListeners();
  }

  getProductEntity() async {
    isLoading = true;
    _productList = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<List<ProductEntity>?> getAllData() async {
    ProductRepository productRepository = ProductRepository();
    List<ProductEntity>? response;
    try {
      response = await productRepository.getProductEntity();
    } catch (err) {
      log(err.toString());
    }
    log(response.toString());
    return response;
  }
}
