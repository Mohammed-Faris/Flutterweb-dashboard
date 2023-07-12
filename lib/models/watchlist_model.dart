class WatchListModel {
  String? id;
  String? name;
  String? contacts;
  String? url;

  WatchListModel({this.id, this.name, this.contacts, this.url});

  WatchListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contacts = json['Contacts'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['Contacts'] = contacts;
    data['url'] = url;
    return data;
  }
}
