import 'dart:convert';

import 'package:web_evaluation/repositories/login/login_response.dart';

import '../../../constants/api_list.dart';
import '../../../resources/api_helper.dart';

class LoginRepo extends ApiBaseHelper {
  dynamic response;
  LoginResponseModel? decodedresponse;

  Future loginrepo(dynamic loginrequest) async {
    {
      response = await post(apiurl['login']!, loginrequest);
      decodedresponse = LoginResponseModel.fromJson(json.decode(response));

      return decodedresponse;
    }
  }
}
