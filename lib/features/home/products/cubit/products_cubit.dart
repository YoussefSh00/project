import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/features/home/products/cubit/products_state.dart';
import 'package:royal_home/features/home/products/data/products_repository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepository) : super(ProductsState());
  final ProductsRepository _productsRepository;
  getProducts(String sortBy) async {
    emit(state.copyWith(getProductsState: RequestStatus.loading));
    try {
      final productsList = await _productsRepository.getProducts(sortBy);
      emit(state.copyWith(
          productsList: productsList, getProductsState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          getProductsState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }
}
