class DrugResponse {
  int? patientId;
  String? drugGroup;
  String? drugName;
  String? howto;
  String? howtoTime;
  String? drugTime;
  String? amount;
  String? amountUnit;
  String? amountTake;
  int? id;
  String? createdAt;
  String? updatedAt;

  DrugResponse(
      {this.patientId,
      this.drugGroup,
      this.drugName,
      this.howto,
      this.howtoTime,
      this.drugTime,
      this.amount,
      this.amountUnit,
      this.amountTake,
      this.id,
      this.createdAt,
      this.updatedAt});

  DrugResponse.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    drugGroup = json['drugGroup'];
    drugName = json['drugName'];
    howto = json['howto'];
    howtoTime = json['howtoTime'];
    drugTime = json['drugTime'];
    amount = json['amount'];
    amountUnit = json['amountUnit'];
    amountTake = json['amountTake'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['drugGroup'] = this.drugGroup;
    data['drugName'] = this.drugName;
    data['howto'] = this.howto;
    data['howtoTime'] = this.howtoTime;
    data['drugTime'] = this.drugTime;
    data['amount'] = this.amount;
    data['amountUnit'] = this.amountUnit;
    data['amountTake'] = this.amountTake;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}