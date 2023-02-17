class EatResponse {
  String? id;
  String? patientId;
  String? ddate;
  String? meal;
  String? foodtype;
  String? howToEat;
  bool? taste;
  String? canEat;
  String? timeStart;
  String? timeEnd;
  String? sumTime;
  String? estimate;
  String? createdAt;
  String? updatedAt;

  EatResponse(
      {this.id,
      this.patientId,
      this.ddate,
      this.meal,
      this.foodtype,
      this.howToEat,
      this.taste,
      this.canEat,
      this.timeStart,
      this.timeEnd,
      this.sumTime,
      this.estimate,
      this.createdAt,
      this.updatedAt});

  EatResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    patientId = json['patientId'].toString();
    ddate = json['ddate'];
    meal = json['meal'];
    foodtype = json['foodType'];
    howToEat = json['howToEat'];
    taste = json['taste'];
    canEat = json['canEat'];
    timeStart = json['timeStart'];
    timeEnd = json['timeEnd'];
    sumTime = json['sumTime'];
    estimate = json['estimate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['patientId'] = this.patientId.toString();
    data['ddate'] = this.ddate;
    data['meal'] = this.meal;
    data['foodtype'] = this.foodtype;
    data['howToEat'] = this.howToEat;
    data['taste'] = this.taste;
    data['canEat'] = this.canEat;
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['sumTime'] = this.sumTime;
    data['estimate'] = this.estimate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
