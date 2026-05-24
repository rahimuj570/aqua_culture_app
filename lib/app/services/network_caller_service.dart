import 'dart:convert';

import 'package:aqua_culture_app/app/models/logger_model.dart';
import 'package:aqua_culture_app/app/models/network_response_model.dart';
import 'package:aqua_culture_app/features/common_role_features/auth/services/auth_prefs_service.dart';
import 'package:http/http.dart';

class NetworkCallerService {
  final Map<String, String>? headers;

  NetworkCallerService({this.headers});

  static final Client _client = Client();

  ///
  //////////MAIN REQUEST METHOD//////////
  ///
  Future<NetworkResponseModel> _request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    bool isAuthRequired = true,
    bool isRetry = false,
  }) async {
    try {
      Request request = Request(method, Uri.parse(url));
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (headers != null) {
        request.headers.addAll(headers!);
      }

      if (isAuthRequired) {
        final token = await AuthPrefsService.instance.getToken();
        if (token != null) {
          request.headers.addAll({'Authorization': 'Bearer $token'});
        }
      }

      if (body != null) {
        request.body = jsonEncode(body);
      }

      LoggerModel(url: url, statusCode: 0, body: body).log(isError: false);

      final streamedResponse = await _client.send(request);

      final response = await Response.fromStream(
        streamedResponse,
      ).timeout(const Duration(seconds: 15));

      bool isSuccess = [200, 201, 202, 204].contains(response.statusCode);

      if (isAuthRequired &&
          !isSuccess &&
          !isRetry &&
          response.statusCode == 401) {
        bool refreshSuccess = await _refreshToken();
        if (refreshSuccess) {
          return _request(
            url: url,
            method: method,
            body: body,
            isAuthRequired: isAuthRequired,
            isRetry: true,
          );
        }

        /// SESSION EXPIRED
        await AuthPrefsService.instance.removeTokens();

        return NetworkResponseModel(
          isSuccess: false,
          statusCode: 401,
          responseData: {'detail': 'Session Expired'},
        );
      }

      dynamic decodedBody;

      try {
        decodedBody = response.body.isNotEmpty
            ? jsonDecode(response.body)
            : null;
      } catch (_) {
        decodedBody = response.body;
      }

      LoggerModel(
        url: url,
        statusCode: response.statusCode,
        body: response.body,
      ).log(isError: !isSuccess);
      return NetworkResponseModel(
        isSuccess: isSuccess,
        statusCode: response.statusCode,
        responseData: decodedBody,
      );
    } catch (e) {
      LoggerModel(
        url: url,
        statusCode: -1,
        body: e.toString(),
      ).log(isError: true);

      return NetworkResponseModel(
        isSuccess: false,
        statusCode: -1,
        responseData: null,
      );
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await AuthPrefsService.instance.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return false;
      }

      Response res = await post(
        Uri.parse('REFRESH_URL'),
        body: {
          jsonEncode({'refresh_token': refreshToken}),
        },
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        await AuthPrefsService.instance.saveToken(data['token']);
        await AuthPrefsService.instance.saveRefreshToken(data['refreshToken']);
        return true;
      }
      return false;
    } catch (e) {
      LoggerModel(
        url: 'REFRESH_URL',
        statusCode: -1,
        body: e.toString(),
      ).log(isError: true);
    }

    return false;
  }

  /// =====================================================
  /// GET
  /// =====================================================

  Future<NetworkResponseModel> getCall({
    required String uri,
    bool isAuthRequired = true,
  }) {
    return _request(method: 'GET', url: uri, isAuthRequired: isAuthRequired);
  }

  /// =====================================================
  /// POST
  /// =====================================================

  Future<NetworkResponseModel> postCall({
    required String uri,
    Map<String, dynamic>? body,
    bool isAuthRequired = true,
  }) {
    return _request(
      method: 'POST',
      url: uri,
      body: body,
      isAuthRequired: isAuthRequired,
    );
  }

  /// =====================================================
  /// PATCH
  /// =====================================================

  Future<NetworkResponseModel> patchCall({
    required String uri,
    Map<String, dynamic>? body,
    bool isAuthRequired = true,
  }) {
    return _request(
      method: 'PATCH',
      url: uri,
      body: body,
      isAuthRequired: isAuthRequired,
    );
  }

  /// =====================================================
  /// PUT
  /// =====================================================

  Future<NetworkResponseModel> putCall({
    required String uri,
    Map<String, dynamic>? body,
    bool isAuthRequired = true,
  }) {
    return _request(
      method: 'PUT',
      url: uri,
      body: body,
      isAuthRequired: isAuthRequired,
    );
  }

  /// =====================================================
  /// DELETE
  /// =====================================================

  Future<NetworkResponseModel> deleteCall({
    required String uri,
    Map<String, dynamic>? body,
    bool isAuthRequired = true,
  }) {
    return _request(
      method: 'DELETE',
      url: uri,
      body: body,
      isAuthRequired: isAuthRequired,
    );
  }

  /// =====================================================
  /// DISPOSE CLIENT
  /// =====================================================

  static void disposeClient() {
    _client.close();
  }
}
