class WipeRwsponse {
  int? id;
  int? patientId;
  int? timelineId;
  String? ddate;
  bool? haveWound;
  String? woundArea;
  String? woundType;
  String? woundSize;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  WipeRwsponse(
      {this.id,
      this.patientId,
      this.timelineId,
      this.ddate,
      this.haveWound,
      this.woundArea,
      this.woundType,
      this.woundSize,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  WipeRwsponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    timelineId = json['timelineId'];
    ddate = json['ddate'];
    haveWound = json['haveWound'];
    woundArea = json['woundArea'];
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
    data['timelineId'] = this.timelineId;
    data['ddate'] = this.ddate;
    data['haveWound'] = this.haveWound;
    data['woundArea'] = this.woundArea;
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