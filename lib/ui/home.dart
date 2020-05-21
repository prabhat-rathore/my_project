import 'package:dropdownapp/ui/admin.dart';
import 'package:dropdownapp/ui/student.dart';
import 'package:dropdownapp/ui/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';




class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendence Management System"),
        backgroundColor: Colors.blueAccent,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset(
            'images/screen.png',
            width: 560.0,
            height: 560.0,
            fit: BoxFit.fill,
          ),
          //Padding(padding: EdgeInsets.all(40.0)),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(65.0)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:100.0,
                  height:40,
                  child: RaisedButton(
                    splashColor: Colors.green,
                    onPressed: () {
                      var router =
                      MaterialPageRoute(builder: (BuildContext context) {
                        return SecondScreen();
                      });
                      Navigator.of(context).push(router);
                    },
                    child: Text("Student"),
                    color: Colors.yellow,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:100.0,
                  height: 40.0,
                  child: RaisedButton(
                    splashColor: Colors.green,
                    onPressed: () {
                      var router =
                      MaterialPageRoute(builder: (BuildContext context) {
                        return ThirdScreen();
                      });
                      Navigator.of(context).push(router);
                    },
                    child: Text("Teacher"),
                    color: Colors.yellow,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100.0,
                  height: 40.0,
                  child: RaisedButton(
                    splashColor: Colors.green,
                    onPressed: () {
                      var router =
                      MaterialPageRoute(builder: (BuildContext context) {
                        return FourthScreen();
                      });
                      Navigator.of(context).push(router);
                    },
                    child: Text("Admin"),
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //String s="";
  var _nameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          //Padding(padding: EdgeInsets.all(45.0)),
          Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/student.png',
                  width: 365.0,
                  height: 230.0,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Container(
            height: 190.0,
            width: 130,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _nameFieldController,
                    decoration: InputDecoration(
                      labelText: "UserName",
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 55.0),
                        child: RaisedButton(
                          onPressed: () {
                            var router =
                            MaterialPageRoute(builder: (BuildContext context) {
                              return SecondScreenFunction(
                                text: _nameFieldController.text,);
                            });
                            if (_nameFieldController.text.isNotEmpty &&
                                _passwordFieldController.text.isNotEmpty &&
                                _passwordFieldController.text.length >= 4) {
                              Navigator.of(context).push(router);
                            }
                            else {
                              print("Please Enter credentials");
                            }
                          },
                          child: Text("Login"),
                          color: Colors.yellow,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 100.0),
                          child: RaisedButton(
                            onPressed: () {
                              var router = MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SecondScreenSign();
                                  }
                              );
                              Navigator.of(context).push(router);
                            },
                            child: Text("SignUp"),
                            color: Colors.yellow,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Please Enter your credentials',
                style: TextStyle(fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class SecondScreenFunction extends StatefulWidget {
  final String text;

  SecondScreenFunction({Key key, this.text}) : super(key: key);

  _SecondScreenFunctionState createState() => _SecondScreenFunctionState();
}

class _SecondScreenFunctionState extends State<SecondScreenFunction> {
  final dbRef=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome:${widget.text}"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(45.0)),
          Container(
            height: 140,
            width: 130,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: RaisedButton(
                    onPressed:readData,
                    child: Text("View Attendence"),
                    color: Colors.yellow,
                  ),
                ),
                ListTile(
                  title: RaisedButton(
                    onPressed: () => debugPrint("Button Pressed"),
                    child: Text("TimeTable"),
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void readData() {
    dbRef.once().then((DataSnapshot dataSnapshot){
      print(dataSnapshot.value);
    });
  }
}



class SecondScreenSign extends StatefulWidget {
  _SecondScreenSignState createState() => _SecondScreenSignState();
}

class _SecondScreenSignState extends State<SecondScreenSign> {
  final dbRef = FirebaseDatabase.instance.reference();
  var _nameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(45.0)),
          Container(
            height: 190,
            width: 130,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _nameFieldController,
                    decoration: InputDecoration(
                      labelText: "USN",
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: "password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 125.0),
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          if (_nameFieldController.text.isNotEmpty &&
                              _passwordFieldController.text.isNotEmpty && _passwordFieldController.text.length>=4) {
                          writeData();}
                          if (_nameFieldController.text.isNotEmpty &&
                              _passwordFieldController.text.isNotEmpty) {
                            _nameFieldController.clear();
                            _passwordFieldController.clear();
                          }
                          else {
                            print("Nothing");
                          }
                        },
                        child: Text("Submit"),
                        color: Colors.yellow,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  void writeData() {
    dbRef.child("Student").set({
      'Name': 'Prabhat Singh',
      'USN': _nameFieldController.text,
      'password': _passwordFieldController.text
    });
  }
}*/


///////////////////////////////////////////////////////////////////////////////////////////////////////////


/*class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  var _nameFieldController2 = TextEditingController();
  var _passwordFieldController2 = TextEditingController();

  //String s2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/teacher.png',
                  width: 400.0,
                  height: 190.0,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(0.0)),
          Container(
            height: 200.0,
            width: 400.0,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _nameFieldController2,
                    decoration: InputDecoration(
                      labelText: "UserName",
                      icon: Icon(Icons.person),
                    ),
                  ),
                ),

                ListTile(
                  title: TextField(
                    controller: _passwordFieldController2,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 55.0),
                        child: RaisedButton(
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ThirdScreenFunction(
                                    name: _nameFieldController2.text,);
                                });
                            if (_nameFieldController2.text.isNotEmpty &&
                                _passwordFieldController2.text.isNotEmpty &&
                                _passwordFieldController2.text.length >= 4) {
                              Navigator.of(context).push(router);
                            }
                            else {
                              print("Please Enter Your Credentials");
                            }
                          },
                          child: Text("Login"),
                          color: Colors.yellow,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100.0),
                        child: RaisedButton(
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ThirdScreenSign();
                                });
                            Navigator.of(context).push(router);
                          },
                          child: Text("SignUP"),
                          color: Colors.yellow,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Please Enter your credentials',
                style: TextStyle(fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThirdScreenSign extends StatefulWidget {
  @override
  _ThirdScreenSignState createState() => _ThirdScreenSignState();
}

class _ThirdScreenSignState extends State<ThirdScreenSign> {
  var _nameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference();

  //String s2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blueGrey,
        body: ListView(
            children: <Widget>[
        Padding(padding: EdgeInsets.all(45.0)),
    Container(
    height: 190,
    width: 130,
    color: Colors.white,
    child: Column(
    children: <Widget>[
    ListTile(
    title: TextField(
    controller: _nameFieldController,
    decoration: InputDecoration(
    labelText: "Enter your email",
    icon: Icon(Icons.email),
    ),
    ),
    ),
    ListTile(
    title: TextField(
    controller: _passwordFieldController,
    decoration: InputDecoration(
    labelText: "password",
    icon: Icon(Icons.lock),
    ),
    obscureText: true,
    ),
    ),
    Container(
    margin: const EdgeInsets.only(left:125.0),
    child: Row(
    children: <Widget>[
    RaisedButton(
    onPressed: (){
    if (_nameFieldController.text.isNotEmpty &&
    _passwordFieldController.text.isNotEmpty && _passwordFieldController.text.length>=4) {
    writeData();}
    if(_nameFieldController.text.isNotEmpty && _passwordFieldController.text.isNotEmpty){
    _nameFieldController.clear();
    _passwordFieldController.clear();}
    else{
    print("Nothing");
    }
    },
    child: Text("Submit"),
    color: Colors.yellow,)
    ],
    ),
    )
    ],
    ),
    ),
    ],
    ),
    );}
    writeData(){
      dbRef.child("Teacher").set({
        'id': 'ID2',
        'email': _nameFieldController.text,
        'password': _passwordFieldController.text
      });
    }
  }


  class ThirdScreenFunction extends StatefulWidget {
  final String name;
  ThirdScreenFunction({Key key,this.name}):super(key :key);
  _ThirdScreenFunctionState createState() => _ThirdScreenFunctionState();
  }

  class _ThirdScreenFunctionState extends State<ThirdScreenFunction> {
  final dbRef=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  return Scaffold(
  appBar: AppBar(
  title: Text("Welcome: ${widget.name}"),
  centerTitle: true,
  backgroundColor: Colors.blue,
  ),
  backgroundColor: Colors.blueGrey,
  body: ListView(
  children: <Widget>[
  Padding(padding: EdgeInsets.all(35.0)),
  Container(
  width: 130,
  height: 180,
  color: Colors.white,
  child: Column(
  children: <Widget>[
  ListTile(
  title: RaisedButton(
  onPressed: () => debugPrint("Pressed"),
  child: Text("Take Attendence"),
  color: Colors.yellow),
  ),
  ListTile(
  title: RaisedButton(
  onPressed:(){
    var router=MaterialPageRoute(
      builder: (BuildContext context){
        return ThirdScreenAddRemove();
      });
    Navigator.of(context).push(router);
  },
  child: Text("Add/Remove Student"),
  color: Colors.yellow,
  ),
  ),
  /*  ListTile(
      title: RaisedButton(
        onPressed: () => debugPrint("Pressed"),
        child: Text("Remove Student"),
        color: Colors.yellow,
      ),
    ),*/
  ListTile(
  title: RaisedButton(
  onPressed: () => debugPrint("Pressed"),
  child: Text("Upadate Attendence"),
  color: Colors.yellow,
  ),
  ),
  ],
  ),
  ),
  ],
  ),
  );
  }}



class ThirdScreenAddRemove extends StatefulWidget{
  _ThirdScreenAddRemoveState createState()=>_ThirdScreenAddRemoveState();
}
class _ThirdScreenAddRemoveState extends State<ThirdScreenAddRemove>{
  var _usnFieldController=TextEditingController();
  var _passwordFieldController=TextEditingController();
  final dbRef=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Remove",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        padding:const EdgeInsets.only(top:20.0),
        children: <Widget>[
          Container(
            width: 400.0,
            height: 190.0,
            color:Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _usnFieldController,
                    decoration: InputDecoration(
                      labelText: "USN",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                ),
                ListTile(
                  title: TextField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: "password",
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left:55.0),
                      child: RaisedButton(
                          onPressed:writeData,
                      child: Text("Add"),
                      color: Colors.yellow,),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left:100.0),
                      child: RaisedButton(
                        onPressed:removeData,
                        child: Text("Remove"),
                        color: Colors.yellow,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  void writeData() {
    dbRef.child("Student").set({
      'USN': _usnFieldController.text,
      'password': _passwordFieldController.text
    });
  }

  void removeData() {
    dbRef.child("3").remove();
  }
}*/


//////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*  class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
  }

  class _FourthScreenState extends State<FourthScreen> {
  var _nameFieldController3 = TextEditingController();
  var _passwordFieldController3 = TextEditingController();
  //String s3="";

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Administrator"),
  centerTitle: true,
  backgroundColor: Colors.blue,
  ),
  backgroundColor: Colors.blueGrey,
  body: ListView(
  children: <Widget>[
  Stack(
  children: <Widget>[
  Center(
  child: Image.asset(
  'images/admin.png',
  width: 365.0,
  height: 230.0,
  fit: BoxFit.fill,
  ),
  )
  ],
  ),
  Padding(padding: EdgeInsets.all(0.0)),
  Container(
  height:190.0,
  width: 400.0,
  color: Colors.white70,
  child: Column(
  children: <Widget>[
  ListTile(
  title: TextField(
  controller: _nameFieldController3,
  decoration: InputDecoration(
  labelText: "UserName",
  icon: Icon(Icons.person),
  ),
  ),
  ),
  ListTile(
  title: TextField(
  controller: _passwordFieldController3,
  decoration: InputDecoration(
  labelText: "Password",
  icon: Icon(Icons.lock),
  ),
  obscureText: true,
  ),
  ),
  Row(
  children: <Widget>[
  Container(
  margin: const EdgeInsets.only(left: 55.0),
  child: RaisedButton(
  onPressed: () {
  var router = MaterialPageRoute(builder: (BuildContext context) {
  return FourthScreenFunction(txt:_nameFieldController3.text);
  });
  if(_nameFieldController3.text.isNotEmpty && _passwordFieldController3.text.isNotEmpty
      && _passwordFieldController3.text.length>=4){
  Navigator.of(context).push(router);}
  else{
  print("Please Enter credentials");
  }
  },
  child: Text("Login"),
  color: Colors.yellow,
  ),
  ),
  Container(
  margin: const EdgeInsets.only(left: 100.0),
  child: RaisedButton(
  onPressed:(){
  var router=MaterialPageRoute(
  builder: (BuildContext context){
  return FourthScreenSign();
  });
  Navigator.of(context).push(router);
  },
  child:Text("SignUp"),
  color: Colors.yellow,),
  ),
  ],
  ),
  ],
  ),
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text("Please Enter your credentials",
  style: TextStyle(fontSize: 19.0,
  fontWeight: FontWeight.w500,
  color: Colors.white),
  ),
  ],
  ),
  ],
  ),
  );
  }
  }




  class FourthScreenFunction extends StatefulWidget {
  final String txt;
  FourthScreenFunction({Key key,this.txt}):super(key :key);
  @override
  _FourthScreenFunctionState createState() => _FourthScreenFunctionState();
  }

  class _FourthScreenFunctionState extends State<FourthScreenFunction> {
  var _nameFieldController3 = TextEditingController();
  var _passwordFieldController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("welcome:${widget.txt}"),
  centerTitle: true,
  backgroundColor: Colors.blue,
  ),
  backgroundColor: Colors.blueGrey,
  body: ListView(
  children: <Widget>[
  Padding(padding: EdgeInsets.all(45.0)),
  Container(
  height: 240.0,
  width: 130.0,
  color: Colors.white,
  child: Column(
  children: <Widget>[
  ListTile(
  title: RaisedButton(
  onPressed: () => debugPrint("Pressed"),
  child: Text("Take Attendence"),
  color: Colors.yellow,
  ),
  ),
  ListTile(
  title: RaisedButton(
  onPressed: () {
    var router=MaterialPageRoute(
        builder: (BuildContext context){
          return ForthScreenAddRemoveStudent();
        });
    Navigator.of(context).push(router);
  },
  child: Text("Add/Remove Student"),
  color: Colors.yellow,
  ),
  ),
  ListTile(
  title: RaisedButton(
  onPressed: (){
    var router=MaterialPageRoute(
        builder:(BuildContext context){
          return ForthScreenAddRemoveTeacher();
    });
    Navigator.of(context).push(router);
  },
  child: Text("Add/Remove teacher"),
  color: Colors.yellow),
  ),
  ListTile(
  title: RaisedButton(
  onPressed: () => debugPrint("Button Pressed"),
  child: Text("Update TimeTable"),
  color: Colors.yellow,
  ),
  ),
  ],
  ),
  ),
  ],
  ),
  );
  }
  }


class ForthScreenAddRemoveStudent extends StatefulWidget{
  _ForthScreenAddRemoveStudentState createState()=>_ForthScreenAddRemoveStudentState();
}
class _ForthScreenAddRemoveStudentState extends State<ForthScreenAddRemoveStudent> {
  var _usnFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Remove",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: <Widget>[
          Container(
            width: 400.0,
            height: 190.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _usnFieldController,
                    decoration: InputDecoration(
                      labelText: "USN",
                      icon: Icon(Icons.confirmation_number),
                    ),
                  ),
                ),
               /* ListTile(
                  title: TextField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: "password",
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),*/
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 55.0),
                      child: RaisedButton(
                        onPressed: () => debugPrint("pressed"),
                        child: Text("Add"),
                        color: Colors.yellow,),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 100.0),
                      child: RaisedButton(
                        onPressed: () => debugPrint("Pressed"),
                        child: Text("Remove"),
                        color: Colors.yellow,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ForthScreenAddRemoveTeacher extends StatefulWidget{
  _ForthScreenAddRemoveTeacherState createState()=>_ForthScreenAddRemoveTeacherState();
}
class _ForthScreenAddRemoveTeacherState extends State<ForthScreenAddRemoveTeacher> {
  var _usnFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Remove",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: <Widget>[
          Container(
            width: 400.0,
            height: 190.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextField(
                    controller: _usnFieldController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email),
                    ),
                  ),
                ),
               /* ListTile(
                  title: TextField(
                    controller: _passwordFieldController,
                    decoration: InputDecoration(
                      labelText: "password",
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),*/
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 55.0),
                      child: RaisedButton(
                        onPressed: () => debugPrint("pressed"),
                        child: Text("Add"),
                        color: Colors.yellow,),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 100.0),
                      child: RaisedButton(
                        onPressed: () => debugPrint("Pressed"),
                        child: Text("Remove"),
                        color: Colors.yellow,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}




  class FourthScreenSign extends StatefulWidget {
  @override
  _FourthScreenSignState createState() => _FourthScreenSignState();
  }

  class _FourthScreenSignState extends State<FourthScreenSign> {
  var _nameFieldController = TextEditingController();
  var _passwordFieldController = TextEditingController();
  final dbRef=FirebaseDatabase.instance.reference();
  //String s2;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Sign Up"),
  centerTitle: true,
  backgroundColor: Colors.blue,
  ),
  backgroundColor: Colors.blueGrey,
  body: ListView(
  children: <Widget>[
  Padding(padding: EdgeInsets.all(45.0)),
  Container(
  height: 190,
  width: 130,
  color: Colors.white,
  child: Column(
  children: <Widget>[
  ListTile(
  title: TextField(
  controller: _nameFieldController,
  decoration: InputDecoration(
  labelText: "Enter your email",
  icon: Icon(Icons.email),
  ),
  ),
  ),
  ListTile(
  title: TextField(
  controller: _passwordFieldController,
  decoration: InputDecoration(
  labelText: "password",
  icon: Icon(Icons.lock),
  ),
  obscureText: true,
  ),
  ),
  Container(
  margin: const EdgeInsets.only(left:125.0),
  child: Row(
  children: <Widget>[
  RaisedButton(
  onPressed: (){
    if (_nameFieldController.text.isNotEmpty &&
    _passwordFieldController.text.isNotEmpty && _passwordFieldController.text.length>=4) {
    writeData();}
    if(_nameFieldController.text.isNotEmpty && _passwordFieldController.text.isNotEmpty){
      _nameFieldController.clear();
      _passwordFieldController.clear();}
    else{
      print("Nothing");
    }
  },
  child: Text("Submit"),
  color: Colors.yellow,)
  ],
  ),
  )
  ],
  ),
  ),
  ],
  ),
  );}
  void writeData(){
    dbRef.child("Admin").set({
      'id': 'ID3',
      'email': _nameFieldController.text,
      'password': _passwordFieldController.text

    });
  }
}*/
