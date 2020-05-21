import 'package:firebase_database/firebase_database.dart';
class Board{
  String usn;
  String name;
  String email;
  String phone;
  String branch;
  Board(this.usn,this.name,this.email,this.phone,this.branch);
  Board.fromSnapshot(DataSnapshot snapshot) {
      //key=snapshot.usn,
      email=snapshot.value["email"];
      usn=snapshot.value["usn"];
      name=snapshot.value["name"];
      phone=snapshot.value["phone"];
      branch=snapshot.value["branch"];
  }

  toJason(){
    return{
      //"usn":usn,
      "name":name,
      "email":email,
      "phone":phone,
      "branch":branch
    };
  }

}