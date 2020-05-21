import 'package:firebase_database/firebase_database.dart';
class Board2{
  //String email;
  String teacherId;
  String name;
  String email;
  String subject;
  String phone;
  Board2(this.teacherId,this.name,this.email,this.subject,this.phone);
  Board2.fromSnapshot(DataSnapshot snapshot) {
  //key=snapshot.usn,
        teacherId=snapshot.value["teacherId"];
        name=snapshot.value["name"];
        email=snapshot.value["email"];
        subject=snapshot.value["subject"];
        phone=snapshot.value["phone"];
  }

  toJason(){
    return{
      //"usn":usn,
      "name":name,
      "email":email,
      "subject":subject,
      "phone":phone,
    };
  }
}