
class DistrictResponse {
  int? id;
  String? code;
  String? nameth;
  String? nameen;
  int? provinceId;
  String? createdAt;
  String? updatedAt;

  DistrictResponse(
      {this.id,
      this.code,
      this.nameth,
      this.nameen,
      this.provinceId,
      this.createdAt,
      this.updatedAt});

  DistrictResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameth = json['nameth'];
    nameen = json['nameen'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nameth'] = this.nameth;
    data['nameen'] = this.nameen;
    data['province_id'] = this.provinceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

