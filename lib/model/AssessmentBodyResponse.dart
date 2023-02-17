class AssessmentBodyResponse {
  String? id;
  String? patientId;
  String? weight;
  String? height;
  String? temp;
  String? pulse1;
  String? pulse2;
  String? bloodPressure1;
  String? bloodPressure2;
  String? co2;
  String? body1;
  String? body1Option;
  String? body2;
  String? body2Option;
  String? body3;
  String? body3Option;
  String? body4;
  String? body4Option;
  String? body5;
  String? body5Option;
  String? body6;
  String? body6Option;
  String? body7;
  String? body7Option;
  String? body8;
  String? body8Option;
  String? createdAt;
  String? updatedAt;

  AssessmentBodyResponse(
      {this.id,
      this.patientId,
      this.weight,
      this.height,
      this.temp,
      this.pulse1,
      this.pulse2,
      this.bloodPressure1,
      this.bloodPressure2,
      this.co2,
      this.body1,
      this.body1Option,
      this.body2,
      this.body2Option,
      this.body3,
      this.body3Option,
      this.body4,
      this.body4Option,
      this.body5,
      this.body5Option,
      this.body6,
      this.body6Option,
      this.body7,
      this.body7Option,
      this.body8,
      this.body8Option,
      this.createdAt,
      this.updatedAt});

  AssessmentBodyResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    weight = json['weight'].toString();
    height = json['height'].toString();
    temp = json['temp'].toString();
    pulse1 = json['pulse1'].toString();
    pulse2 = json['pulse2'].toString();
    bloodPressure1 = json['bloodPressure1'].toString();
    bloodPressure2 = json['bloodPressure2'].toString();
    co2 = json['co2'].toString();
    body1 = json['body1'].toString();
    body1Option = json['body1_option'].toString();
    body2 = json['body2'].toString();
    body2Option = json['body2_option'].toString();
    body3 = json['body3'].toString();
    body3Option = json['body3_option'].toString();
    body4 = json['body4'].toString();
    body4Option = json['body4_option'].toString();
    body5 = json['body5'].toString();
    body5Option = json['body5_option'].toString();
    body6 = json['body6'].toString();
    body6Option = json['body6_option'].toString();
    body7 = json['body7'].toString();
    body7Option = json['body7_option'].toString();
    body8 = json['body8'].toString();
    body8Option = json['body8_option'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['patientId'] = this.patientId.toString();
    data['weight'] = this.weight.toString();
    data['height'] = this.height.toString();
    data['temp'] = this.temp.toString();
    data['pulse1'] = this.pulse1.toString();
    data['pulse2'] = this.pulse2.toString();
    data['bloodPressure1'] = this.bloodPressure1.toString();
    data['bloodPressure2'] = this.bloodPressure2.toString();
    data['co2'] = this.co2.toString();
    data['body1'] = this.body1;
    data['body1_option'] = this.body1Option;
    data['body2'] = this.body2;
    data['body2_option'] = this.body2Option;
    data['body3'] = this.body3;
    data['body3_option'] = this.body3Option;
    data['body4'] = this.body4;
    data['body4_option'] = this.body4Option;
    data['body5'] = this.body5;
    data['body5_option'] = this.body5Option;
    data['body6'] = this.body6;
    data['body6_option'] = this.body6Option;
    data['body7'] = this.body7;
    data['body7_option'] = this.body7Option;
    data['body8'] = this.body8;
    data['body8_option'] = this.body8Option;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}