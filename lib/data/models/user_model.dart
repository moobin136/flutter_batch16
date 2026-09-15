
class UserModel {
  String? status;
  Data? data;
  String? token;

  UserModel({this.status, this.data, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class Data {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? createdDate;

  Data({this.id, this.email, this.firstName, this.lastName, this.mobile, this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    email = json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    mobile = json["mobile"];
    createdDate = json["createdDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["email"] = email;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["mobile"] = mobile;
    _data["createdDate"] = createdDate;
    return _data;
  }
}