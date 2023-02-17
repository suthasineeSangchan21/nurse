class floorResponse {
  int? id;
  int? buildingId;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Zone>? zone;

  floorResponse(
      {this.id,
      this.buildingId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.zone});

  floorResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buildingId = json['buildingId'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['zone'] != null) {
      zone = <Zone>[];
      json['zone'].forEach((v) {
        zone!.add(new Zone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buildingId'] = this.buildingId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.zone != null) {
      data['zone'] = this.zone!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Zone {
  int? id;
  int? floorId;
  String? name;
  String? fileName;
  String? createdAt;
  String? updatedAt;
  List<Bed>? bed;

  Zone(
      {this.id,
      this.floorId,
      this.name,
      this.fileName,
      this.createdAt,
      this.updatedAt,
      this.bed});

  Zone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    floorId = json['floorId'];
    name = json['name'];
    fileName = json['fileName'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['bed'] != null) {
      bed = <Bed>[];
      json['bed'].forEach((v) {
        bed!.add(new Bed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['floorId'] = this.floorId;
    data['name'] = this.name;
    data['fileName'] = this.fileName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bed != null) {
      data['bed'] = this.bed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bed {
  int? id;
  int? zoneId;
  String? name;
  String? icon;
  String? status;
  int? patientId;
  String? createdAt;
  String? updatedAt;

  Bed(
      {this.id,
      this.zoneId,
      this.name,
      this.icon,
      this.status,
      this.patientId,
      this.createdAt,
      this.updatedAt});

  Bed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneId = json['zoneId'];
    name = json['name'];
    icon = json['icon'];
    status = json['status'];
    patientId = json['patientId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zoneId'] = this.zoneId;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['status'] = this.status;
    data['patientId'] = this.patientId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
