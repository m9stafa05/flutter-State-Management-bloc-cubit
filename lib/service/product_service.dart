import 'package:dio/dio.dart';
import 'package:flutter_state_management/model/product_model.dart';

class ProductService {
  getProductService() async {
    final dio = Dio();
    final response = await dio.get(
      'https://fakestoreapi.com/products',
    );

    if (response.statusCode == 200) {
      List<ProductModel> productList = (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      return productList;
    } else {
      throw Exception(
        "The request failed with status: ${response.statusCode}",
      );
    }
  }
}
