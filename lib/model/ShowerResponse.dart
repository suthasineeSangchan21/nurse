class ShowerResponse {
 int? id;
  int? patientId;
  String? ddate;
  String? howToShower;
  String? howToTeeth;
  bool? bodyOdor;
  String? skin;
  String? tooth;
  String? gum;
  String? detail;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  ShowerResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.howToShower,
      this.howToTeeth,
      this.bodyOdor,
      this.skin,
      this.tooth,
      this.gum,
      this.detail,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  ShowerResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    ddate = json['ddate'];
    howToShower = json['howToShower'];
    howToTeeth = json['howToTeeth'];
    bodyOdor = json['bodyOdor'];
    skin = json['skin'];
    tooth = json['tooth'];
    gum = json['gum'];
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
    data['howToShower'] = this.howToShower;
    data['howToTeeth'] = this.howToTeeth;
    data['bodyOdor'] = this.bodyOdor;
    data['skin'] = this.skin;
    data['tooth'] = this.tooth;
    data['gum'] = this.gum;
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