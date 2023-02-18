class HealthResponse {
  String? id;
  String? patientId;
  String? ddate;
  String? weight;
  String? hight;
  String? temp;
  String? pulse1;
  String? pulse2;
  String? breathe1;
  String? breathe2;
  String? bloodPressure1;
  String? bloodPressure2;
  String? co2;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  HealthResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.weight,
      this.hight,
      this.temp,
      this.pulse1,
      this.pulse2,
      this.breathe1,
      this.breathe2,
      this.bloodPressure1,
      this.bloodPressure2,
      this.co2,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  HealthResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    ddate = json['ddate'];
    weight = json['weight'].toString();
    hight = json['hight'].toString();
    temp = json['temp'].toString();
    pulse1 = json['pulse1'].toString();
    pulse2 = json['pulse2'].toString();
    breathe1 = json['breathe1'].toString();
    breathe2 = json['breathe2'].toString();
    bloodPressure1 = json['bloodPressure1'].toString();
    bloodPressure2 = json['bloodPressure2'].toString();
    co2 = json['co2'].toString();
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
    data['weight'] = this.weight.toString();
    data['hight'] = this.hight.toString();
    data['temp'] = this.temp.toString();
    data['pulse1'] = this.pulse1.toString();
    data['pulse2'] = this.pulse2.toString();
    data['breathe1'] = this.breathe1.toString();
    data['breathe2'] = this.breathe2.toString();
    data['bloodPressure1'] = this.bloodPressure1.toString();
    data['bloodPressure2'] = this.bloodPressure2.toString();
    data['co2'] = this.co2.toString();
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
