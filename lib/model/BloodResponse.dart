class ListBloodResponse {
  List<BloodResponse>? data;

  ListBloodResponse({this.data});

  ListBloodResponse.fromJson(Map<String, dynamic> json) {
    if (json[0] != null) {
      data = <BloodResponse>[];
      json[0].forEach((v) {
        data!.add(new BloodResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data[''] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class BloodResponse {
  int? id;
  String? name;

  BloodResponse({this.id, this.name});

  BloodResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}