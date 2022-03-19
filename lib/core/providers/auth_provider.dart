import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lab12_clubme_mobile/core/api/auth/auth_rest.dart';
import 'package:lab12_clubme_mobile/core/api/exceptions/api_exception.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRest restClient = AuthRest();

  login({String username = '', String password = ''}) async {
    try {
      final login = await restClient.login(username: username, password: password);
      return login;
    }
    on DioError catch (e) {
      final errorStatus = e.response?.statusCode;
      final errorToken = e.response?.data?['message'];
      switch (errorToken) {
        case EXCEPTION_TOKEN.LOGIN_USERNAME_INCORRECT: {
          throw 'Username is not correct';
        }
        case EXCEPTION_TOKEN.LOGIN_PASSWORD_INCORRECT: {
          throw 'Password is not correct';
        }
      }
      // return errorToken;
    }

  }
}