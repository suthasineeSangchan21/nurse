class ActivityResponse {
  String? id;
  String? patientId;
  String? ddate;
  String? activity;
  String? part;
  String? happy;
  String? social;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  ActivityResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.activity,
      this.part,
      this.happy,
      this.social,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  ActivityResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    ddate = json['ddate'];
    activity = json['activity'];
    part = json['part'].toString();
    happy = json['happy'].toString();
    social = json['social'].toString();
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
    data['activity'] = this.activity;
    data['part'] = this.part.toString();
    data['happy'] = this.happy.toString();
    data['social'] = this.social.toString();
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
