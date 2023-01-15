class UserModel{
  String? uid;
  String? fullname;
  String? email;
  String? phone;
  String? course;
  String? profilepic;
  static double lat=0;
  static double long=0;

  UserModel({this.uid,this.fullname,this.email,this.phone,this.course,this.profilepic});
  UserModel.fromMap(Map<String,dynamic>map){
    uid=map["uid"];
    fullname=map["fullname"];
    email=map["email"];
    phone=map["phone"];
    course=map["course"];
    profilepic=map["profilepic"];
  }
  Map<String,dynamic>toMap(){
    return {
      "uid":uid,
      "fullname":fullname,
      "email":email,
      "phone":phone,
      "course":course,
      "profilepic":profilepic
    };
  }
}