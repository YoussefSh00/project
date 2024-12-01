import 'package:royal_home/core/models/error_message_model.dart';
import 'package:royal_home/core/utils/status.dart';
import 'package:royal_home/features/home/categories/data/models/categories_model.dart';

class CategoriesState {
  final List<CategoriesModel>? categoriesList;
  final RequestStatus? getCategoriesState;
  final ErrorMessageModel? errorMessageModel;

  CategoriesState({
    this.categoriesList,
    this.getCategoriesState,
    this.errorMessageModel,
  });
  CategoriesState copyWith({
    List<CategoriesModel>? categoriesList,
    RequestStatus? getCategoriesState,
    ErrorMessageModel? errorMessageModel,
  }) {
    return CategoriesState(
      categoriesList: categoriesList ?? this.categoriesList,
      getCategoriesState: getCategoriesState ?? this.getCategoriesState,
      errorMessageModel: errorMessageModel ?? this.errorMessageModel,
    );
  }
}
