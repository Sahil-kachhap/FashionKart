import 'dart:developer';
import 'package:fashion_kart/data/data_sources/products_remote_source.dart';
import 'package:fashion_kart/data/dto/product_model.dart';
import 'package:fashion_kart/domain/entity/product_entity.dart';

class ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource =
      ProductRemoteDataSource();

  Future<List<ProductEntity>> getProductEntity() async {
    List<Product> productList = await _productRemoteDataSource.getProducts();
    
    List<ProductEntity> productEntity = productList
        .map((product) {
         ProductEntity entity = ProductEntity(
            title: product.title, image: product.image, price: product.price, description: product.description);
         log(entity.title.toString());
         return entity;
      }).toList();

    return productEntity;
  }
}
