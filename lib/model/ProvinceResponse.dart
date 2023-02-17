class ProvinceResponse {
  int? id;
  String? code;
  String? nameth;
  String? nameen;
  String? createdAt;
  String? updatedAt;

  ProvinceResponse(
      {this.id,
      this.code,
      this.nameth,
      this.nameen,
      this.createdAt,
      this.updatedAt});

  ProvinceResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameth = json['nameth'];
    nameen = json['nameen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nameth'] = this.nameth;
    data['nameen'] = this.nameen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}