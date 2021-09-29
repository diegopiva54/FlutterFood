import '../../../constants/api.dart';
import '../dio_client.dart';

class FoodRepository {
  var _httpClient;

  FoodRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getFoods(String tokenCompany,
      {List<String> filterCategories}) async {
    // print(categories);
    final response =
        await _httpClient.get("$API_VERSION/products", queryParameters: {
      'token_company': tokenCompany,
      'categories': filterCategories != null && filterCategories.length > 0
          ? filterCategories
          : []
    });
    print(filterCategories);

    // print(response.data['data']);

    return (response.data['data'] as List).toList();
  }
}
