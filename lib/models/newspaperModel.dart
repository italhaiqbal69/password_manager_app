class NewspaperModel {
  List<Newspapers> newspapers;

  NewspaperModel({required this.newspapers});

  NewspaperModel.fromJson(Map<String, dynamic> json)
      : newspapers = json['newspapers'] != null
      ? List<Newspapers>.from(
      json['newspapers'].map((v) => Newspapers.fromJson(v)))
      : [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newspapers'] = newspapers.map((v) => v.toJson()).toList();
    return data;
  }
}

class Newspapers {
  String lccn;
  String url;
  String state;
  String title;

  Newspapers({required this.lccn, required this.url, required this.state, required this.title});

  Newspapers.fromJson(Map<String, dynamic> json)
      : lccn = json['lccn'],
        url = json['url'],
        state = json['state'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lccn'] = lccn;
    data['url'] = url;
    data['state'] = state;
    data['title'] = title;
    return data;
  }
}
