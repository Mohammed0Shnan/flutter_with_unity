class EducationLevelResponse {
  String statusCode;
  String msg;
  LevelResponseModel data;

  EducationLevelResponse({this.statusCode, this.msg, this.data});

  EducationLevelResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'] != null 
        ? new LevelResponseModel.fromJson(json['Data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    return data;
  }
}

class LevelResponseModel {
  String image;
  String userName;
  String role;
  String lastName;
  String location;
  String phone;

  

  LevelResponseModel(
      {this.image,
      this.userName,
      this.lastName,
      this.location,
      this.phone,
      this.role,
      });

  LevelResponseModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    userName = json['userName'];
    lastName = json['lastName'];
    location = json['location'];
    phone = json['phone'];
    role = json['role'];
    //services = json['services']== null? null:(json['services'] as List).map((e) => Data.fromJson(e)).toList();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['userName'] = this.userName;
    data['lastName'] = this.lastName;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['role'] = this.role;
    //data['services'] = this.services;
    return data;
  }
}


