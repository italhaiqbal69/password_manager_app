class CurrencyModel {
  List<Data>? data;

  CurrencyModel({this.data});

  factory CurrencyModel.fromJson(Map<dynamic, dynamic> json) {
    return CurrencyModel(
      data: json['data'] != null
          ? List<Data>.from(json['data'].map((v) => Data.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((v) => v.toJson()).toList(),
    };
  }
}

class Data {
  String? id;
  String? name;
  String? minSize;

  Data({this.id, this.name, this.minSize});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      minSize: json['min_size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'min_size': minSize,
    };
  }
}
