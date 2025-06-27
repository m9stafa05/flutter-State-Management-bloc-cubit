import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/model/product_model.dart';
import 'package:flutter_state_management/service/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  ProductService productService = ProductService();

  getProductData() async {
    try {
      final List<ProductModel> product = await productService
          .getProductService();
      emit(ProductSuccess(productList: product));
    } catch (e) {
      emit(ProductFailed(errorMessage: e.toString()));
    }
  }
}
