class ImageTimeline {
  String? id;
  String? activityEatId;

  ImageTimeline(
      {this.id,
      this.activityEatId});

  ImageTimeline.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    activityEatId = json['activityEatId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['activityEatId'] = this.activityEatId.toString();
    return data;
  }
}
