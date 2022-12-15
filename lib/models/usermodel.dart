class UserModel{
  String ? uid;
  String ? fullname;
  String ? email;
  String ? phone;
  String ? course;
  String ? profilepic;

  UserModel({required this.uid,required this.fullname,required this.email,required this.phone,required this.course,required this.profilepic});
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