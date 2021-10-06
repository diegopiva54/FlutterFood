import 'package:dio/dio.dart';

import '../../../helpers/toast_helpers.dart';

class ApiException {
  Response<dynamic> response;

  ApiException(errorsResponse) {
    response = errorsResponse;

    showErrors();
  }

  showErrors() {
    print(response);
    print(response.statusCode);
    print(response.data);

    Map errors = response.data['errors'];
    String allErrors = "";

    errors.forEach((key, value) => allErrors = allErrors + value[0] + "\n");

    if (errors != null) {
      if (response.statusCode == 422) {
        FlutterFoodToast.error(allErrors);

        return;
      }

      if (response.statusCode >= 400 && response.statusCode < 500) {
        FlutterFoodToast.error('Requisição inválida');

        return;
      }

      if (response.statusCode == 404) {
        FlutterFoodToast.error('Página não encontrada');

        return;
      }

      FlutterFoodToast.error('Falha ao fazer a requisição');

      return;
    }
  }
}
