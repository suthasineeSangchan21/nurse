class DutyScheduleResponse {
  int? id;
  int? bedId;
  int? userId;
  bool? monday;
  bool? tuesday;
  bool? wednesday;
  bool? thursday;
  bool? friday;
  bool? saturday;
  bool? sunday;
  String? mondayTimeStart;
  String? tuesdayTimeStart;
  String? wednesdayTimeStart;
  String? thursdayTimeStart;
  String? fridayTimeStart;
  String? saturdayTimeStart;
  String? sundayTimeStart;
  String? mondayTimeStop;
  String? tuesdayTimeStop;
  String? wednesdayTimeStop;
  String? thursdayTimeStop;
  String? fridayTimeStop;
  String? saturdayTimeStop;
  String? sundayTimeStop;
  String? createdAt;
  String? updatedAt;

  DutyScheduleResponse(
      {this.id,
      this.bedId,
      this.userId,
      this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday,
      this.mondayTimeStart,
      this.tuesdayTimeStart,
      this.wednesdayTimeStart,
      this.thursdayTimeStart,
      this.fridayTimeStart,
      this.saturdayTimeStart,
      this.sundayTimeStart,
      this.mondayTimeStop,
      this.tuesdayTimeStop,
      this.wednesdayTimeStop,
      this.thursdayTimeStop,
      this.fridayTimeStop,
      this.saturdayTimeStop,
      this.sundayTimeStop,
      this.createdAt,
      this.updatedAt});

  DutyScheduleResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bedId = json['bedId'];
    userId = json['userId'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
    mondayTimeStart = json['mondayTimeStart'];
    tuesdayTimeStart = json['tuesdayTimeStart'];
    wednesdayTimeStart = json['wednesdayTimeStart'];
    thursdayTimeStart = json['thursdayTimeStart'];
    fridayTimeStart = json['fridayTimeStart'];
    saturdayTimeStart = json['saturdayTimeStart'];
    sundayTimeStart = json['sundayTimeStart'];
    mondayTimeStop = json['mondayTimeStop'];
    tuesdayTimeStop = json['tuesdayTimeStop'];
    wednesdayTimeStop = json['wednesdayTimeStop'];
    thursdayTimeStop = json['thursdayTimeStop'];
    fridayTimeStop = json['fridayTimeStop'];
    saturdayTimeStop = json['saturdayTimeStop'];
    sundayTimeStop = json['sundayTimeStop'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bedId'] = this.bedId;
    data['userId'] = this.userId;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    data['mondayTimeStart'] = this.mondayTimeStart;
    data['tuesdayTimeStart'] = this.tuesdayTimeStart;
    data['wednesdayTimeStart'] = this.wednesdayTimeStart;
    data['thursdayTimeStart'] = this.thursdayTimeStart;
    data['fridayTimeStart'] = this.fridayTimeStart;
    data['saturdayTimeStart'] = this.saturdayTimeStart;
    data['sundayTimeStart'] = this.sundayTimeStart;
    data['mondayTimeStop'] = this.mondayTimeStop;
    data['tuesdayTimeStop'] = this.tuesdayTimeStop;
    data['wednesdayTimeStop'] = this.wednesdayTimeStop;
    data['thursdayTimeStop'] = this.thursdayTimeStop;
    data['fridayTimeStop'] = this.fridayTimeStop;
    data['saturdayTimeStop'] = this.saturdayTimeStop;
    data['sundayTimeStop'] = this.sundayTimeStop;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}