import 'dart:convert';

import '../../constants/api_list.dart';
import '../../constants/app_constants.dart';
import '../../models/watchlist_model.dart';
import '../../resources/api_helper.dart';

class Watchlistrepo extends ApiBaseHelper {
  dynamic response;

  List<WatchListModel> decodedresponse = [];

  Future<List<WatchListModel>> watchlistrepo() async {
    response = await ApiBaseHelper().get(apiurl[contactliststring]!);
    for (var element in List.from(json.decode(response))) {
      decodedresponse.add(WatchListModel.fromJson(element));
    }

    return decodedresponse;
  }
}
