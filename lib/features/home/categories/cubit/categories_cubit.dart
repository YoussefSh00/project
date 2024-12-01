import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/features/home/categories/cubit/categories_state.dart';
import 'package:royal_home/features/home/categories/data/categories_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepository) : super(CategoriesState());
  final CategoriesRepository _categoriesRepository;

  getCategories() async {
    emit(state.copyWith(getCategoriesState: RequestStatus.loading));
    try {
      final categoriesList = await _categoriesRepository.getCategories();
      emit(state.copyWith(
          categoriesList: categoriesList,
          getCategoriesState: RequestStatus.loaded));
    } on DioException catch (e) {
      emit(state.copyWith(
          getCategoriesState: RequestStatus.failure,
          errorMessageModel: ErrorMessageModel(e)));
    }
  }
}
