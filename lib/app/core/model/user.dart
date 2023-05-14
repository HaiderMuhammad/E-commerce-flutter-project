import 'package:real_e_commerce/app/core/data/firestore/references.dart';



enum Type{
  ceo,
  manager,
  hr,
  employee
}

class UserModel {
  String? uid, email, name, pic, type;
  // late final Type? accountType;

  UserModel({
    this.uid,
    this.type,
    this.email,
    this.name,
    this.pic
  });
      // : accountType = Type.values.firstWhere((e) => e.name == type);


  UserModel.fromJson(Map json) {
    type = json['type'];
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
      'pic': pic,
      'type': type
    };
  }
}