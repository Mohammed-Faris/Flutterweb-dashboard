import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

import '../constants/app_constants.dart';
import 'api_status.dart';

class ApiBaseHelper extends ApiStatus {
  final String _baseUrl = "";

  Future<dynamic> get(String methodUri, [dynamic queryParam = '']) async {
    dynamic responseJson;

    try {
      String requestUrl = _baseUrl + methodUri + queryParam;
      debugPrint(requestUrl);
      Map<String, String> headers = await _createHeaders();

      final response = await http.get(Uri.parse(requestUrl), headers: headers);

      var statusCode = response.statusCode;
      if (ApiStatus.successStatus.contains(statusCode)) {
        responseJson = response.body;
      } else if (ApiStatus.errorStatus.contains(statusCode)) {
        responseJson = response.body;
      }
    } on SocketException {
      responseJson = {"error": socketExcep};
    }

    return responseJson;
  }

  Future<dynamic> post(String url, dynamic request) async {
    debugPrint(_baseUrl + url);

    dynamic responseJson;

    try {
      Map<String, String> headers = await _createHeaders();
      debugPrint(headers.toString());
      final response = await http.post(Uri.parse(_baseUrl + url),
          headers: headers, body: request);
      var statusCode = response.statusCode;
      if (ApiStatus.successStatus.contains(statusCode)) {
        responseJson = response.body;
      } else if (ApiStatus.errorStatus.contains(statusCode)) {
        responseJson = response.body;
      }
    } on SocketException {
      responseJson = {"error": socketExcep};
    }

    return responseJson;
  }

  Future<Map<String, String>> _createHeaders() async {
    Map<String, String> headers = <String, String>{};
    if (html.window.localStorage.containsKey(authToken)) {
      var xAuthToken = html.window.localStorage[authToken]!;

      headers['content-type'] = 'application/json';

      headers['accept'] = 'application/json, text/plain, */*, application/json';
      headers['xAuthToken'] = xAuthToken;
    }

    return headers;
  }
}
