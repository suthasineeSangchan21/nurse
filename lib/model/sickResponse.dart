class SickResponse {
  int? patientId;
  String? sick;
  String? referForm;
  String? howToMove;
  String? howToMoveOther;
  bool? ventilator;
  bool? pressureSores;
  bool? neckPiercing;
  bool? phlegm;
  int? id;
  String? createdAt;
  String? updatedAt;

  SickResponse(
      {this.patientId,
      this.sick,
      this.referForm,
      this.howToMove,
      this.howToMoveOther,
      this.ventilator,
      this.pressureSores,
      this.neckPiercing,
      this.phlegm,
      this.id,
      this.createdAt,
      this.updatedAt});

  SickResponse.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    sick = json['sick'];
    referForm = json['referForm'];
    howToMove = json['howToMove'];
    howToMoveOther = json['howToMoveOther'];
    ventilator = json['Ventilator'];
    pressureSores = json['pressureSores'];
    neckPiercing = json['neckPiercing'];
    phlegm = json['phlegm'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['sick'] = this.sick;
    data['referForm'] = this.referForm;
    data['howToMove'] = this.howToMove;
    data['howToMoveOther'] = this.howToMoveOther;
    data['Ventilator'] = this.ventilator;
    data['pressureSores'] = this.pressureSores;
    data['neckPiercing'] = this.neckPiercing;
    data['phlegm'] = this.phlegm;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}