class PhysicResponse {
  int? id;
  int? patientId;
  String? ddate;
  String? armLeft;
  String? armRight;
  String? legLeft;
  String? legRight;
  String? neck;
  String? back;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  PhysicResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.armLeft,
      this.armRight,
      this.legLeft,
      this.legRight,
      this.neck,
      this.back,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  PhysicResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    ddate = json['ddate'];
    armLeft = json['armLeft'];
    armRight = json['armRight'];
    legLeft = json['legLeft'];
    legRight = json['legRight'];
    neck = json['neck'];
    back = json['back'];
    detail = json['detail'];
    timeStart = json['timeStart'];
    timeEnd = json['timeEnd'];
    sumTime = json['sumTime'];
    estimate = json['estimate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['ddate'] = this.ddate;
    data['armLeft'] = this.armLeft;
    data['armRight'] = this.armRight;
    data['legLeft'] = this.legLeft;
    data['legRight'] = this.legRight;
    data['neck'] = this.neck;
    data['back'] = this.back;
    data['detail'] = this.detail;
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['sumTime'] = this.sumTime;
    data['estimate'] = this.estimate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}