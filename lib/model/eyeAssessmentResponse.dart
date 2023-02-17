class AssessmentResponse {
  int? id;
  int? patientId;
  String? step1;
  String? step2;
  String? step3;
  String? step4;
  String? step5;
  String? step51;
  String? step52;
  String? step53;
  String? step6;
  String? step7;
  String? step8;
  String? step9;
  String? step10;
  String? step11;
  String? step12;
  String? createdAt;
  String? updatedAt;

  AssessmentResponse(
      {this.id,
      this.patientId,
      this.step1,
      this.step2,
      this.step3,
      this.step4,
      this.step5,
      this.step51,
      this.step52,
      this.step53,
      this.step6,
      this.step7,
      this.step8,
      this.step9,
      this.step10,
      this.step11,
      this.step12,
      this.createdAt,
      this.updatedAt});

  AssessmentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    step1 = json['Step1'];
    step2 = json['Step2'];
    step3 = json['Step3'];
    step4 = json['Step4'];
    step5 = json['Step5'];
    step51 = json['Step5_1'];
    step52 = json['Step5_2'];
    step53 = json['Step5_3'];
    step6 = json['Step6'];
    step7 = json['Step7'];
    step8 = json['Step8'];
    step9 = json['Step9'];
    step10 = json['Step10'];
    step11 = json['Step11'];
    step12 = json['Step12'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['Step1'] = this.step1;
    data['Step2'] = this.step2;
    data['Step3'] = this.step3;
    data['Step4'] = this.step4;
    data['Step5'] = this.step5;
    data['Step5_1'] = this.step51;
    data['Step5_2'] = this.step52;
    data['Step5_3'] = this.step53;
    data['Step6'] = this.step6;
    data['Step7'] = this.step7;
    data['Step8'] = this.step8;
    data['Step9'] = this.step9;
    data['Step10'] = this.step10;
    data['Step11'] = this.step11;
    data['Step12'] = this.step12;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
