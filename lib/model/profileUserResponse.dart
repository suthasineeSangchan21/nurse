class ProfileUserResponse {
  int? id;
  String? code;
  String? username;
  String? firstName;
  String? lastName;
  String? phone;
  int? positionId;
  String? filename;
  String? createdAt;
  String? updatedAt;

  ProfileUserResponse(
      {this.id,
      this.code,
      this.username,
      this.firstName,
      this.lastName,
      this.phone,
      this.positionId,
      this.filename,
      this.createdAt,
      this.updatedAt});

  ProfileUserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    positionId = json['position_id'];
    filename = json['filename'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['position_id'] = this.positionId;
    data['filename'] = this.filename;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
