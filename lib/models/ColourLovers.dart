class ColorsModel {
  int? id;
  String? title;
  String? userName;
  int? numViews;
  int? numVotes;
  int? numComments;
  int? numHearts;
  int? rank;
  String? dateCreated;
  String? hex;
  Rgb? rgb;
  Hsv? hsv;
  String? description;
  String? url;
  String? imageUrl;
  String? badgeUrl;
  String? apiUrl;

  ColorsModel({
    this.id,
    this.title,
    this.userName,
    this.numViews,
    this.numVotes,
    this.numComments,
    this.numHearts,
    this.rank,
    this.dateCreated,
    this.hex,
    this.rgb,
    this.hsv,
    this.description,
    this.url,
    this.imageUrl,
    this.badgeUrl,
    this.apiUrl,
  });

  factory ColorsModel.fromJson(Map<dynamic, dynamic> json) {
    return ColorsModel(
      id: json['id'],
      title: json['title'],
      userName: json['userName'],
      numViews: json['numViews'],
      numVotes: json['numVotes'],
      numComments: json['numComments'],
      numHearts: json['numHearts'],
      rank: json['rank'],
      dateCreated: json['dateCreated'],
      hex: json['hex'],
      rgb: json['rgb'] != null ? Rgb.fromJson(json['rgb']) : null,
      hsv: json['hsv'] != null ? Hsv.fromJson(json['hsv']) : null,
      description: json['description'],
      url: json['url'],
      imageUrl: json['imageUrl'],
      badgeUrl: json['badgeUrl'],
      apiUrl: json['apiUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['userName'] = userName;
    data['numViews'] = numViews;
    data['numVotes'] = numVotes;
    data['numComments'] = numComments;
    data['numHearts'] = numHearts;
    data['rank'] = rank;
    data['dateCreated'] = dateCreated;
    data['hex'] = hex;
    if (rgb != null) {
      data['rgb'] = rgb!.toJson();
    }
    if (hsv != null) {
      data['hsv'] = hsv!.toJson();
    }
    data['description'] = description;
    data['url'] = url;
    data['imageUrl'] = imageUrl;
    data['badgeUrl'] = badgeUrl;
    data['apiUrl'] = apiUrl;
    return data;
  }
}

class Rgb {
  int red;
  int green;
  int blue;

  Rgb({required this.red, required this.green, required this.blue});

  factory Rgb.fromJson(Map<String, dynamic> json) {
    return Rgb(
      red: json['red'],
      green: json['green'],
      blue: json['blue'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['red'] = red;
    data['green'] = green;
    data['blue'] = blue;
    return data;
  }
}

class Hsv {
  int hue;
  int saturation;
  int value;

  Hsv({required this.hue, required this.saturation, required this.value});

  factory Hsv.fromJson(Map<String, dynamic> json) {
    return Hsv(
      hue: json['hue'],
      saturation: json['saturation'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hue'] = hue;
    data['saturation'] = saturation;
    data['value'] = value;
    return data;
  }
}
