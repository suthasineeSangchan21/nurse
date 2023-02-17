class UploadResponse {
  String? fileName;

  UploadResponse({this.fileName});

  UploadResponse.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    return data;
  }
}
