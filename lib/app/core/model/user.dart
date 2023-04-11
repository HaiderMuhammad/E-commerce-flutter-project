



class UserModel {
  String? uid, email, name, pic;

  UserModel({this.uid, this.email, this.name, this.pic});

  UserModel.fromJson(Map  json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    pic = json['pic'];
  }

  Map<String,dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'pic': pic
    };
  }
}