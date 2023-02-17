class SubDistrictResponse {
  int? id;
  String? code;
  String? nameth;
  String? nameen;
  int? districtId;
  String? postcode;
  String? createdAt;
  String? updatedAt;

  SubDistrictResponse(
      {this.id,
      this.code,
      this.nameth,
      this.nameen,
      this.districtId,
      this.postcode,
      this.createdAt,
      this.updatedAt});

  SubDistrictResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameth = json['nameth'];
    nameen = json['nameen'];
    districtId = json['district_id'];
    postcode = json['postcode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nameth'] = this.nameth;
    data['nameen'] = this.nameen;
    data['district_id'] = this.districtId;
    data['postcode'] = this.postcode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}