import '../models/watchlist_model.dart';

class WatchListCalculations {
  dynamic watchlistlen, watchlistmod;
  final List<Map<String, dynamic>> dropdownlistData = [];
  List<List<WatchListModel>> watchlistfiltered = [];
  int watchlistlength(dynamic data) {
    watchlistlen = data.length ~/ 20;
    watchlistmod = data.length % 20;
    if (watchlistmod > 0) {
      watchlistlen = watchlistlen + 1;
    }

    return watchlistlen;
  }

  List<Map<String, dynamic>> dropdownlist(int watchlistlen) {
    for (int i = 0; i < watchlistlen; i++) {
      dropdownlistData.add(
        {"value": i, "text": "Contacts ${i + 1}"},
      );
    }
    return dropdownlistData;
  }

  watchlistFiltered(List<WatchListModel> data, int splitperpage) {
    for (int i = 0; i < data.length; i = i + 20) {
      watchlistfiltered.add(data.sublist(i, i + 20));
    }
    return watchlistfiltered;
  }
}
