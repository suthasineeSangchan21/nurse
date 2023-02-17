class TimelineResponse {
  String? id;
  String? patientId;
  String? ddate;
  String? activity1Id;
  String? activity1;
  String? activity1Time;
  String? activity2Id;
  String? activity2;
  String? activity2Time;
  String? activity3Id;
  String? activity3;
  String? activity3Time;
  String? activity4Id;
  String? activity4;
  String? activity4Time;
  String? activity5Id;
  String? activity5;
  String? activity5Time;
  String? activity6Id;
  String? activity6;
  String? activity6Time;
  String? activity7Id;
  String? activity7;
  String? activity7Time;
  String? activity8Id;
  String? activity8;
  String? activity8Time;
  String? activity9Id;
  String? activity9;
  String? activity9Time;
  String? activity10Id;
  String? activity10;
  String? activity10Time;
  String? activity11Id;
  String? activity11;
  String? activity11Time;
  String? createdAt;
  String? updatedAt;

  TimelineResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.activity1Id,
      this.activity1,
      this.activity1Time,
      this.activity2Id,
      this.activity2,
      this.activity2Time,
      this.activity3Id,
      this.activity3,
      this.activity3Time,
      this.activity4Id,
      this.activity4,
      this.activity4Time,
      this.activity5Id,
      this.activity5,
      this.activity5Time,
      this.activity6Id,
      this.activity6,
      this.activity6Time,
      this.activity7Id,
      this.activity7,
      this.activity7Time,
      this.activity8Id,
      this.activity8,
      this.activity8Time,
      this.activity9Id,
      this.activity9,
      this.activity9Time,
      this.activity10Id,
      this.activity10,
      this.activity10Time,
      this.activity11Id,
      this.activity11,
      this.activity11Time,
      this.createdAt,
      this.updatedAt});

  TimelineResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    ddate = json['ddate'].toString();
    activity1Id = json['activity1_id'].toString();
    activity1 = json['activity1'].toString();
    activity1Time = json['activity1Time'].toString();
    activity2Id = json['activity2_id'].toString();
    activity2 = json['activity2'].toString();
    activity2Time = json['activity2Time'].toString();
    activity3Id = json['activity3_id'].toString();
    activity3 = json['activity3'].toString();
    activity3Time = json['activity3Time'].toString();
    activity4Id = json['activity4_id'].toString();
    activity4 = json['activity4'].toString();
    activity4Time = json['activity4Time'].toString();
    activity5Id = json['activity5_id'].toString();
    activity5 = json['activity5'].toString();
    activity5Time = json['activity5Time'].toString();
    activity6Id = json['activity6_id'].toString();
    activity6 = json['activity6'].toString();
    activity6Time = json['activity6Time'].toString();
    activity7Id = json['activity7_id'].toString();
    activity7 = json['activity7'].toString();
    activity7Time = json['activity7Time'].toString();
    activity8Id = json['activity8_id'].toString();
    activity8 = json['activity8'].toString();
    activity8Time = json['activity8Time'].toString();
    activity9Id = json['activity9_id'].toString();
    activity9 = json['activity9'].toString();
    activity9Time = json['activity9Time'].toString();
    activity10Id = json['activity10_id'].toString();
    activity10 = json['activity10'].toString();
    activity10Time = json['activity10Time'].toString();
    activity11Id = json['activity11_id'].toString();
    activity11 = json['activity11'].toString();
    activity11Time = json['activity11Time'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['ddate'] = this.ddate;
    data['activity1_id'] = this.activity1Id;
    data['activity1'] = this.activity1;
    data['activity1Time'] = this.activity1Time;
    data['activity2_id'] = this.activity2Id;
    data['activity2'] = this.activity2;
    data['activity2Time'] = this.activity2Time;
    data['activity3_id'] = this.activity3Id;
    data['activity3'] = this.activity3;
    data['activity3Time'] = this.activity3Time;
    data['activity4_id'] = this.activity4Id;
    data['activity4'] = this.activity4;
    data['activity4Time'] = this.activity4Time;
    data['activity5_id'] = this.activity5Id;
    data['activity5'] = this.activity5;
    data['activity5Time'] = this.activity5Time;
    data['activity6_id'] = this.activity6Id;
    data['activity6'] = this.activity6;
    data['activity6Time'] = this.activity6Time;
    data['activity7_id'] = this.activity7Id;
    data['activity7'] = this.activity7;
    data['activity7Time'] = this.activity7Time;
    data['activity8_id'] = this.activity8Id;
    data['activity8'] = this.activity8;
    data['activity8Time'] = this.activity8Time;
    data['activity9_id'] = this.activity9Id;
    data['activity9'] = this.activity9;
    data['activity9Time'] = this.activity9Time;
    data['activity10_id'] = this.activity10Id;
    data['activity10'] = this.activity10;
    data['activity10Time'] = this.activity10Time;
    data['activity11_id'] = this.activity11Id;
    data['activity11'] = this.activity11;
    data['activity11Time'] = this.activity11Time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}