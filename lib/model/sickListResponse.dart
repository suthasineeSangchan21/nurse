class SickListResponse {
  int? id;
  int? patientId;
  String? sick;
  String? referForm;
  String? howToMove;
  String? howToMoveOther;
  bool? ventilator;
  bool? pressureSores;
  bool? neckPiercing;
  bool? phlegm;
  String? createdAt;
  String? updatedAt;

  SickListResponse(
      {this.id,
      this.patientId,
      this.sick,
      this.referForm,
      this.howToMove,
      this.howToMoveOther,
      this.ventilator,
      this.pressureSores,
      this.neckPiercing,
      this.phlegm,
      this.createdAt,
      this.updatedAt});

  SickListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    sick = json['sick'];
    referForm = json['referForm'];
    howToMove = json['howToMove'];
    howToMoveOther = json['howToMoveOther'];
    ventilator = json['Ventilator'];
    pressureSores = json['pressureSores'];
    neckPiercing = json['neckPiercing'];
    phlegm = json['phlegm'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['sick'] = this.sick;
    data['referForm'] = this.referForm;
    data['howToMove'] = this.howToMove;
    data['howToMoveOther'] = this.howToMoveOther;
    data['Ventilator'] = this.ventilator;
    data['pressureSores'] = this.pressureSores;
    data['neckPiercing'] = this.neckPiercing;
    data['phlegm'] = this.phlegm;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SickDataResponse {
  int? id = 0;
  int? patientId = 0;
  String? sick = "";
  String? referForm = "";
  String? howToMove = "";
  String? howToMoveOther = "";
  bool? ventilator = false;
  bool? pressureSores = false;
  bool? neckPiercing = false;
  bool? phlegm = false;
  String? createdAt = "";
  String? updatedAt = "";
}
