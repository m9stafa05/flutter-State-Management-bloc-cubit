part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {
  const ProductLoading();
}

final class ProductSuccess extends ProductState {
  final List<ProductModel> productList;

  const ProductSuccess({required this.productList});

  @override
  List<Object> get props => [productList];
}

final class ProductFailed extends ProductState {
  final String errorMessage;

  const ProductFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
