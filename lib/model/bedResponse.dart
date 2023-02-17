class bedResponse {
  int? id;
  int? zoneId;
  String? name;
  String? icon;
  String? status;
  int? patientId;
  String? rotation;
  String? positionX;
  String? positionY;
  int? userId;
  String? createdAt;
  String? updatedAt;
  bool? opt_clotheset;
  bool? opt_cabinet;
  bool? opt_tv;

  bedResponse({
    this.id,
    this.zoneId,
    this.name,
    this.icon,
    this.status,
    this.patientId,
    this.rotation,
    this.positionX,
    this.positionY,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.opt_clotheset,
    this.opt_cabinet,
    this.opt_tv,
  });

  bedResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneId = json['zoneId'];
    name = json['name'];
    icon = json['icon'];
    status = json['status'];
    patientId = json['patientId'];
    rotation = json['rotation'];
    positionX = json['positionX'];
    positionY = json['positionY'];
    userId = json['userId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    opt_clotheset = json['opt_clotheset'];
    opt_cabinet = json['opt_cabinet'];
    opt_tv = json['opt_tv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zoneId'] = this.zoneId;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['patientId'] = this.patientId;
    data['rotation'] = this.rotation;
    data['positionX'] = this.positionX;
    data['positionY'] = this.positionY;
    data['userId'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['opt_cabinet'] = this.updatedAt;
    data['opt_clotheset'] = this.updatedAt;
    data['opt_tv'] = this.updatedAt;
    return data;
  }
}
