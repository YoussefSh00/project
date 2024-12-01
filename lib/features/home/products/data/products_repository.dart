import 'package:royal_home/core/services/remote/api_service.dart';
import 'package:royal_home/features/home/categories/data/models/categories_model.dart';
import 'package:royal_home/features/home/products/data/models/products_model.dart';

class ProductsRepository {
  final ApiService _apiService;

  ProductsRepository(this._apiService);

  Future<List<ProductsModel>> getProducts(String sortBy) async {
    final response = await _apiService
        .get( "products/user/products", params: {
      "page": 1,
      "limit": 10,
      "sortBy": sortBy
    });
    List responseBody = response.data['payload']['data'];
    return responseBody
        .map(
          (e) => ProductsModel.fromJson(e),
        )
        .toList();
  }
}
