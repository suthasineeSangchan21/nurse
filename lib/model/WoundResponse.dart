class WoundResponse {
  int? id;
  int? patientId;
  String? ddate;
  String? area;
  String? woundType;
  int? woundSize;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  WoundResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.area,
      this.woundType,
      this.woundSize,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  WoundResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    ddate = json['ddate'];
    area = json['area'];
    woundType = json['woundType'];
    woundSize = json['woundSize'];
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
    data['area'] = this.area;
    data['woundType'] = this.woundType;
    data['woundSize'] = this.woundSize;
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
