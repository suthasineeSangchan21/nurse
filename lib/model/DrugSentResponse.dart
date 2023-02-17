class DrugSentResponse {
  int? patientId;
  String? ddate;
  String? drugName;
  String? howTo;
  String? drugType;
  String? causeOfUse;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  int? timelineId;
  int? id;
  String? createdAt;
  String? updatedAt;

  DrugSentResponse(
      {this.patientId,
      this.ddate,
      this.drugName,
      this.howTo,
      this.drugType,
      this.causeOfUse,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.timelineId,
      this.id,
      this.createdAt,
      this.updatedAt});

  DrugSentResponse.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    ddate = json['ddate'];
    drugName = json['drugName'];
    howTo = json['howTo'];
    drugType = json['drugType'];
    causeOfUse = json['causeOfUse'];
    detail = json['detail'];
    timeStart = json['timeStart'];
    timeEnd = json['timeEnd'];
    sumTime = json['sumTime'];
    estimate = json['estimate'];
    timelineId = json['timelineId'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['ddate'] = this.ddate;
    data['drugName'] = this.drugName;
    data['howTo'] = this.howTo;
    data['drugType'] = this.drugType;
    data['causeOfUse'] = this.causeOfUse;
    data['detail'] = this.detail;
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['sumTime'] = this.sumTime;
    data['estimate'] = this.estimate;
    data['timelineId'] = this.timelineId;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
