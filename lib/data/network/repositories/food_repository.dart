import '../../../constants/api.dart';
import '../dio_client.dart';

class FoodRepository {
  var _httpClient;

  FoodRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getFoods(String tokenCompany) async {
    final response = await _httpClient.get("$API_VERSION/products",
        queryParameters: {'token_company': tokenCompany});

    // print(response.data['data']);

    return (response.data['data'] as List).toList();
  }
}
