import 'dart:developer';
import 'package:fashion_kart/data/repository/product_repository.dart';
import 'package:fashion_kart/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{
  List<ProductEntity>? _productList = [];
  List<String>? _cartList = [];


  List<ProductEntity> get getProductList => _productList!;
  List<String> get getCartList => _cartList!;


  bool isLoading = false;

  addToCart(String imageUrl){
    if(!_cartList!.contains(imageUrl)){
      _cartList!.add(imageUrl);
      notifyListeners();
    }else{
      removeFromCart(imageUrl);
    }
  }

  removeFromCart(String imageUrl){
    _cartList!.removeWhere((element) => element == imageUrl);
    notifyListeners();
  }

  getProductEntity() async{
    isLoading =true;
    _productList = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<List<ProductEntity>?> getAllData() async{
    ProductRepository productRepository = ProductRepository();
    List<ProductEntity>? response;
    try{
       response = await productRepository.getProductEntity();
    }catch(err){
      log(err.toString());
    }
    log(response.toString());
    return response;
  }
}