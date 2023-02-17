class PatientResponse {
  int? id;
  int? userId;
  String? ddate;
  String? hn;
  String? title;
  String? firstName;
  String? lastName;
  String? nickName;
  String? gender;
  String? idCard;
  String? birthDate;
  String? age;
  String? bloodType;
  String? address;
  int? subDistrictId;
  int? districtId;
  int? provinceId;
  String? zip;
  int? countryId;
  String? phone;
  String? email;
  String? rel1FirstName;
  String? rel1LastName;
  String? rel1Id;
  String? rel1Phone;
  bool? rel1Main;
  String? rel2FirstName;
  String? rel2LastName;
  String? rel2Id;
  String? rel2Phone;
  bool? rel2Main;
  String? rel3FirstName;
  String? rel3LastName;
  String? rel3Id;
  String? rel3Phone;
  bool? rel3Main;
  String? rel4FirstName;
  String? rel4LastName;
  String? rel4Id;
  String? rel4Phone;
  bool? welfare;
  String? hospital1;
  String? doctor1;
  String? hospital2;
  String? doctor2;
  String? fileIdcard;
  String? fileHouseRegister;
  String? fileContact;
  String? fileLiving;
  String? createdAt;
  String? updatedAt;

  PatientResponse(
      {this.id,
      this.userId,
      this.ddate,
      this.hn,
      this.title,
      this.firstName,
      this.lastName,
      this.nickName,
      this.gender,
      this.idCard,
      this.birthDate,
      this.age,
      this.bloodType,
      this.address,
      this.subDistrictId,
      this.districtId,
      this.provinceId,
      this.zip,
      this.countryId,
      this.phone,
      this.email,
      this.rel1FirstName,
      this.rel1LastName,
      this.rel1Id,
      this.rel1Phone,
      this.rel1Main,
      this.rel2FirstName,
      this.rel2LastName,
      this.rel2Id,
      this.rel2Phone,
      this.rel2Main,
      this.rel3FirstName,
      this.rel3LastName,
      this.rel3Id,
      this.rel3Phone,
      this.rel3Main,
      this.rel4FirstName,
      this.rel4LastName,
      this.rel4Id,
      this.rel4Phone,
      this.welfare,
      this.hospital1,
      this.doctor1,
      this.hospital2,
      this.doctor2,
      this.fileIdcard,
      this.fileHouseRegister,
      this.fileContact,
      this.fileLiving,
      this.createdAt,
      this.updatedAt});

  PatientResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    ddate = json['ddate'];
    hn = json['hn'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    nickName = json['nickName'];
    gender = json['gender'];
    idCard = json['idCard'];
    birthDate = json['birthDate'];
    age = json['age'];
    bloodType = json['bloodType'];
    address = json['address'];
    subDistrictId = json['sub_district_id'];
    districtId = json['district_id'];
    provinceId = json['province_id'];
    zip = json['zip'];
    countryId = json['country_id'];
    phone = json['phone'];
    email = json['email'];
    rel1FirstName = json['rel1FirstName'];
    rel1LastName = json['rel1LastName'];
    rel1Id = json['rel1_id'];
    rel1Phone = json['rel1Phone'];
    rel1Main = json['rel1Main'];
    rel2FirstName = json['rel2FirstName'];
    rel2LastName = json['rel2LastName'];
    rel2Id = json['rel2_id'];
    rel2Phone = json['rel2Phone'];
    rel2Main = json['rel2Main'];
    rel3FirstName = json['rel3FirstName'];
    rel3LastName = json['rel3LastName'];
    rel3Id = json['rel3_id'];
    rel3Phone = json['rel3Phone'];
    rel3Main = json['rel3Main'];
    rel4FirstName = json['rel4FirstName'];
    rel4LastName = json['rel4LastName'];
    rel4Id = json['rel4_id'];
    rel4Phone = json['rel4Phone'];
    welfare = json['welfare'];
    hospital1 = json['hospital1'];
    doctor1 = json['doctor1'];
    hospital2 = json['hospital2'];
    doctor2 = json['doctor2'];
    fileIdcard = json['file_idcard'];
    fileHouseRegister = json['file_house_register'];
    fileContact = json['file_contact'];
    fileLiving = json['file_living'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['ddate'] = this.ddate;
    data['hn'] = this.hn;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['nickName'] = this.nickName;
    data['gender'] = this.gender;
    data['idCard'] = this.idCard;
    data['birthDate'] = this.birthDate;
    data['age'] = this.age;
    data['bloodType'] = this.bloodType;
    data['address'] = this.address;
    data['sub_district_id'] = this.subDistrictId;
    data['district_id'] = this.districtId;
    data['province_id'] = this.provinceId;
    data['zip'] = this.zip;
    data['country_id'] = this.countryId;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['rel1FirstName'] = this.rel1FirstName;
    data['rel1LastName'] = this.rel1LastName;
    data['rel1_id'] = this.rel1Id;
    data['rel1Phone'] = this.rel1Phone;
    data['rel1Main'] = this.rel1Main;
    data['rel2FirstName'] = this.rel2FirstName;
    data['rel2LastName'] = this.rel2LastName;
    data['rel2_id'] = this.rel2Id;
    data['rel2Phone'] = this.rel2Phone;
    data['rel2Main'] = this.rel2Main;
    data['rel3FirstName'] = this.rel3FirstName;
    data['rel3LastName'] = this.rel3LastName;
    data['rel3_id'] = this.rel3Id;
    data['rel3Phone'] = this.rel3Phone;
    data['rel3Main'] = this.rel3Main;
    data['rel4FirstName'] = this.rel4FirstName;
    data['rel4LastName'] = this.rel4LastName;
    data['rel4_id'] = this.rel4Id;
    data['rel4Phone'] = this.rel4Phone;
    data['welfare'] = this.welfare;
    data['hospital1'] = this.hospital1;
    data['doctor1'] = this.doctor1;
    data['hospital2'] = this.hospital2;
    data['doctor2'] = this.doctor2;
    data['file_idcard'] = this.fileIdcard;
    data['file_house_register'] = this.fileHouseRegister;
    data['file_contact'] = this.fileContact;
    data['file_living'] = this.fileLiving;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}