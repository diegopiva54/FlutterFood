import '../dio_client.dart';
import '../../../constants/api.dart';

class EvaluationRepository {
  var _httpClient;

  EvaluationRepository() {
    _httpClient = new DioClient();
  }

  Future makeEvaluationOrder(String identifyOrder, int stars,
      {String comment}) async {
    final response = await _httpClient.post(
        "/auth/$API_VERSION/orders/$identifyOrder/evaluations",
        formData: {
          'identify': identifyOrder,
          'stars': stars,
          'comment': comment ?? '',
        });

    return response;
  }
}
