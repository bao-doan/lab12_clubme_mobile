import 'package:lab12_clubme_mobile/core/api/auth/auth_request_model.dart';
import 'package:lab12_clubme_mobile/core/api/auth/auth_response_model.dart';
import 'package:lab12_clubme_mobile/core/api/rest_client_mixin.dart';

class AuthRest with RestClientMixin {
  login({required String username, required String password}) async {
    final body = AuthRequestModel(username: username, password: password).toMap();
    final result = await post('auth/login', body, {});
    final authData = AuthReponseModel.fromMap(result.data);
    print(authData.toString());
    return authData;
  }
}