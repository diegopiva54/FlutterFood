import '../dio_client.dart';
import '../../../models/Restaurant.dart';
import '../../../constants/api.dart';

class RestaurantRepository {
  var _httpClient;

  RestaurantRepository() {
    _httpClient = DioClient();
  }

  Future<List<Restaurant>> getRestaurants() async {
    final response = await _httpClient.get("$API_VERSION/tenants");
    final List _restaurants = (response.data['data'] as List).map((restaurant) {
      // _restaurants.add(Restaurant.fromJson(restaurant));
      // print('------------------');
      return Restaurant.fromJson(restaurant);
    }).toList();

    return _restaurants;
  }
}
