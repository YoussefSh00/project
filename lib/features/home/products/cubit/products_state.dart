import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/features/home/categories/data/models/categories_model.dart';
import 'package:royal_home/features/home/products/data/models/products_model.dart';

class ProductsState {
  final List<ProductsModel>? productsList;
  final RequestStatus? getProductsState;
  final ErrorMessageModel? errorMessageModel;

  ProductsState({
    this.productsList,
    this.getProductsState,
    this.errorMessageModel,
  });
  ProductsState copyWith({
    List<ProductsModel>? productsList,
    RequestStatus? getProductsState,
    ErrorMessageModel? errorMessageModel,
  }) {
    return ProductsState(
      productsList: productsList ?? this.productsList,
      getProductsState: getProductsState ?? this.getProductsState,
      errorMessageModel: errorMessageModel ?? this.errorMessageModel,
    );
  }
}
