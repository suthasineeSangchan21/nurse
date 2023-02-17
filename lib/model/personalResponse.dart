class PersonalResponse {
  String? patientId;
  String? status;
  String? spouseName;
  String? child;
  String? education;
  String? schoolName;
  String? yearEdu;
  String? company;
  String? position;
  String? startWork;
  String? endWork;
  String? hobby;
  String? exerciseDay;
  String? eatVeg;
  String? dringWater;
  String? religion;
  String? society;
  String? todo;
  String? isChild;
  String? isSmoke;
  String? isDrink;
  String? id;
  String? createdAt;
  String? updatedAt;

  PersonalResponse(
      {this.patientId,
      this.status,
      this.spouseName,
      this.child,
      this.education,
      this.schoolName,
      this.yearEdu,
      this.company,
      this.position,
      this.startWork,
      this.endWork,
      this.hobby,
      this.exerciseDay,
      this.eatVeg,
      this.dringWater,
      this.religion,
      this.society,
      this.todo,
      this.isChild,
      this.isSmoke,
      this.isDrink,
      this.id,
      this.createdAt,
      this.updatedAt});

  PersonalResponse.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'].toString();
    status = json['status'].toString();
    spouseName = json['spouseName'].toString();
    child = json['child'].toString();
    education = json['education'].toString();
    schoolName = json['schoolName'].toString();
    yearEdu = json['yearEdu'].toString();
    company = json['company'].toString();
    position = json['position'].toString();
    startWork = json['startWork'].toString();
    endWork = json['endWork'].toString();
    hobby = json['hobby'].toString();
    exerciseDay = json['exerciseDay'].toString();
    eatVeg = json['eatVeg'].toString();
    dringWater = json['dringWater'].toString();
    religion = json['religion'].toString();
    society = json['society'].toString();
    todo = json['todo'].toString();
    isChild = json['isChild'].toString();
    isSmoke = json['isSmoke'].toString();
    isDrink = json['isDrink'].toString();
    id = json['id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientId'] = this.patientId;
    data['status'] = this.status;
    data['spouseName'] = this.spouseName;
    data['child'] = this.child;
    data['education'] = this.education;
    data['schoolName'] = this.schoolName;
    data['yearEdu'] = this.yearEdu;
    data['company'] = this.company;
    data['position'] = this.position;
    data['startWork'] = this.startWork;
    data['endWork'] = this.endWork;
    data['hobby'] = this.hobby;
    data['exerciseDay'] = this.exerciseDay;
    data['eatVeg'] = this.eatVeg;
    data['dringWater'] = this.dringWater;
    data['religion'] = this.religion;
    data['society'] = this.society;
    data['todo'] = this.todo;
    data['isChild'] = this.isChild;
    data['isSmoke'] = this.isSmoke;
    data['isDrink'] = this.isDrink;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
