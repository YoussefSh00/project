import 'package:royal_home/core/services/remote/api_service.dart';
import 'package:royal_home/features/home/categories/data/models/categories_model.dart';

class CategoriesRepository {
  final ApiService _apiService;

  CategoriesRepository(this._apiService);

  Future<List<CategoriesModel>> getCategories() async {
    final response = await _apiService.get("categories/user/categories/public",
        requiresAuth: false);
    List responseBody = response.data['payload']['data'];
    return responseBody
        .map(
          (e) => CategoriesModel.fromJson(e),
        )
        .toList();
  }
}
