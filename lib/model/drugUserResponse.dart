class DrugUserResponse {
  int? id;
  int? patientId;
  String? drugGroup;
  String? drugName;
  String? howto;
  String? howtoTime;
  String? drugTime;
  String? amount;
  String? amountUnit;
  String? amountTake;
  String? createdAt;
  String? updatedAt;

  DrugUserResponse(
      {this.id,
      this.patientId,
      this.drugGroup,
      this.drugName,
      this.howto,
      this.howtoTime,
      this.drugTime,
      this.amount,
      this.amountUnit,
      this.amountTake,
      this.createdAt,
      this.updatedAt});

  DrugUserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patientId'];
    drugGroup = json['drugGroup'];
    drugName = json['drugName'];
    howto = json['howto'];
    howtoTime = json['howtoTime'];
    drugTime = json['drugTime'];
    amount = json['amount'];
    amountUnit = json['amountUnit'];
    amountTake = json['amountTake'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patientId'] = this.patientId;
    data['drugGroup'] = this.drugGroup;
    data['drugName'] = this.drugName;
    data['howto'] = this.howto;
    data['howtoTime'] = this.howtoTime;
    data['drugTime'] = this.drugTime;
    data['amount'] = this.amount;
    data['amountUnit'] = this.amountUnit;
    data['amountTake'] = this.amountTake;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}