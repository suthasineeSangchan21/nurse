class WoundResponse {
  String? id;
  String? patientId;
  String? ddate;
  String? area;
  String? woundType;
  String? woundSize;
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
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    ddate = json['ddate'];
    area = json['area'];
    woundType = json['woundType'];
    woundSize = json['woundSize'].toString();
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
    data['id'] = this.id.toString();
    data['patientId'] = this.patientId.toString();
    data['ddate'] = this.ddate;
    data['area'] = this.area;
    data['woundType'] = this.woundType;
    data['woundSize'] = this.woundSize.toString();
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
