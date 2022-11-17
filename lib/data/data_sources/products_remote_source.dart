import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/product_model.dart';

class ProductRemoteDataSource {
  final String _baseUrl =
      "https://fakestoreapi.com/products/category/women's%20clothing";

  Future<List<Product>> getProducts() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final productList = (jsonDecode(response.body) as List)
          .map((post) => Product.fromJson(post))
          .toList();
      return productList;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
