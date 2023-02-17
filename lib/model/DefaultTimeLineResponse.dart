class DefaultTimeLineResponse {
  int? id;
  int? activity1Id;
  String? activity1;
  String? activity1Time;
  int? activity2Id;
  String? activity2;
  String? activity2Time;
  int? activity3Id;
  String? activity3;
  String? activity3Time;
  int? activity4Id;
  String? activity4;
  String? activity4Time;
  int? activity5Id;
  String? activity5;
  String? activity5Time;
  int? activity6Id;
  String? activity6;
  String? activity6Time;
  int? activity7Id;
  String? activity7;
  String? activity7Time;
  int? activity8Id;
  String? activity8;
  String? activity8Time;
  int? activity9Id;
  String? activity9;
  String? activity9Time;
  int? activity10Id;
  String? activity10;
  String? activity10Time;
  int? activity11Id;
  String? activity11;
  String? activity11Time;

  DefaultTimeLineResponse(
      {this.id,
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
      this.activity11Time});

  DefaultTimeLineResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity1Id = json['activity1_id'];
    activity1 = json['activity1'];
    activity1Time = json['activity1Time'];
    activity2Id = json['activity2_id'];
    activity2 = json['activity2'];
    activity2Time = json['activity2Time'];
    activity3Id = json['activity3_id'];
    activity3 = json['activity3'];
    activity3Time = json['activity3Time'];
    activity4Id = json['activity4_id'];
    activity4 = json['activity4'];
    activity4Time = json['activity4Time'];
    activity5Id = json['activity5_id'];
    activity5 = json['activity5'];
    activity5Time = json['activity5Time'];
    activity6Id = json['activity6_id'];
    activity6 = json['activity6'];
    activity6Time = json['activity6Time'];
    activity7Id = json['activity7_id'];
    activity7 = json['activity7'];
    activity7Time = json['activity7Time'];
    activity8Id = json['activity8_id'];
    activity8 = json['activity8'];
    activity8Time = json['activity8Time'];
    activity9Id = json['activity9_id'];
    activity9 = json['activity9'];
    activity9Time = json['activity9Time'];
    activity10Id = json['activity10_id'];
    activity10 = json['activity10'];
    activity10Time = json['activity10Time'];
    activity11Id = json['activity11_id'];
    activity11 = json['activity11'];
    activity11Time = json['activity11Time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    return data;
  }
}
