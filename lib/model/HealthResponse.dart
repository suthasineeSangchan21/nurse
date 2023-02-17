class HealthResponse {
  int? id;
  int? patientId;
  String? ddate;
  int? weight;
  int? hight;
  int? temp;
  int? pulse1;
  int? pulse2;
  int? breathe1;
  int? breathe2;
  int? bloodPressure1;
  int? bloodPressure2;
  int? co2;
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
    id = json['id'];
    patientId = json['patientId'];
    ddate = json['ddate'];
    weight = json['weight'];
    hight = json['hight'];
    temp = json['temp'];
    pulse1 = json['pulse1'];
    pulse2 = json['pulse2'];
    breathe1 = json['breathe1'];
    breathe2 = json['breathe2'];
    bloodPressure1 = json['bloodPressure1'];
    bloodPressure2 = json['bloodPressure2'];
    co2 = json['co2'];
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
    data['weight'] = this.weight;
    data['hight'] = this.hight;
    data['temp'] = this.temp;
    data['pulse1'] = this.pulse1;
    data['pulse2'] = this.pulse2;
    data['breathe1'] = this.breathe1;
    data['breathe2'] = this.breathe2;
    data['bloodPressure1'] = this.bloodPressure1;
    data['bloodPressure2'] = this.bloodPressure2;
    data['co2'] = this.co2;
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
