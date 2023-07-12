class LoginResponseModel {
  String? errormessage;
  String? token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    for (String key in json.keys) {
      if (key.toLowerCase() == 'token') {
        token = json[key];
      } else if (key.toLowerCase() == 'error') {
        errormessage = json[key];
      }
    }
  }
}
