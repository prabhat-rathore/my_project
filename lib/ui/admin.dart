import 'package:dropdownapp/model/board.dart';
import 'package:dropdownapp/model/board2.dart';
import 'package:flutter/material.dart';
import'package:firebase_database/firebase_database.dart';
class FourthScreen extends StatefulWidget {
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

//**********************************************************************************************************


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
                    child: Text("Change Password"),
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
//*************************************************************************************************************
class ForthScreenAddRemoveStudent extends StatefulWidget{
  _ForthScreenAddRemoveStudentState createState()=>_ForthScreenAddRemoveStudentState();
}
class _ForthScreenAddRemoveStudentState extends State<ForthScreenAddRemoveStudent>{
  final dbRef=FirebaseDatabase.instance.reference();
  List<Board> boardMessage=List();
  Board board;
  final formkey=GlobalKey<FormState>();
  DatabaseReference databaseReference;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    board=Board("","","","","");
    databaseReference=dbRef.child("Student");
    databaseReference.onChildChanged.listen(_onEntryAdded);
  }
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
      // backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 0,
                child: Center(
                  child: Form(
                    key: formkey,
                    child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person),
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter name",
                          ),
                          initialValue:"" ,
                          onSaved: (val)=>board.name=val,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.confirmation_number),
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter USN",
                          ),
                          initialValue:"" ,
                          onSaved: (val)=>board.usn=val,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                          initialValue:"" ,
                          onSaved: (val)=>board.email=val,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Phone No",
                          ),
                          initialValue:"" ,
                          onSaved: (val)=>board.phone=val,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.subject),
                        title: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Branch",
                          ),
                          initialValue:"" ,
                          onSaved: (val)=>board.branch=val,
                          validator: (val)=>val==""?val:null,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 55.0),
                            child:RaisedButton(
                                child:Text("Add"),
                                color: Colors.yellow,
                                onPressed:()
                                {
                                  handleAdd();
                                }
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 100.0),
                            child: RaisedButton(
                                child:Text("Remove"),
                                color: Colors.yellow,
                                onPressed:(){
                                  handleRemove();
                                }
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _onEntryAdded(Event event) {
    setState(() {
      boardMessage.add(Board.fromSnapshot(event.snapshot));
    });
  }

  handleAdd() {
    final FormState form=formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      dbRef.child("Student").child(board.usn).set(board.toJason());
    }
  }



  handleRemove() {
    final FormState form=formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      dbRef.child("Student").child(board.usn).remove();
    }


  }
}
//*****************************************************************************************


class ForthScreenAddRemoveTeacher extends StatefulWidget{
  _ForthScreenAddRemoveTeacherState createState()=>_ForthScreenAddRemoveTeacherState();
}
class _ForthScreenAddRemoveTeacherState extends State<ForthScreenAddRemoveTeacher>{
  final dbRef=FirebaseDatabase.instance.reference();
  List<Board2> boardMessgae=List();
  Board2 board;
  final formkey=GlobalKey<FormState>();
  DatabaseReference databaseReference;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    board=Board2("","","","","");
    databaseReference=dbRef.child("Teacher");
    databaseReference.onChildChanged.listen(_onEntryAdded);
  }
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
      // backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                flex: 0,
                child: Form(
                key: formkey,
                child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.perm_identity),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      initialValue:"" ,
                      onSaved: (val)=>board.name=val,
                      validator: (val)=>val==""?val:null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "teacher Id",
                      ),
                      initialValue:"" ,
                      onSaved: (val)=>board.teacherId=val,
                      validator: (val)=>val==""?val:null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      initialValue:"" ,
                      onSaved: (val)=>board.email=val,
                      validator: (val)=>val==""?val:null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Phone No",
                      ),
                      initialValue:"" ,
                      onSaved: (val)=>board.phone=val,
                      validator: (val)=>val==""?val:null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.subject),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Branch",
                      ),
                      initialValue:"" ,
                      onSaved: (val)=>board.subject=val,
                      validator: (val)=>val==""?val:null,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 55.0),
                        child:RaisedButton(
                            child:Text("Add"),
                            color: Colors.yellow,
                            onPressed:()
                            {
                              handleAdd();
                            }
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 100.0),
                        child: RaisedButton(
                            child:Text("Remove"),
                            color: Colors.yellow,
                            onPressed:(){
                              handleRemove();
                            }
                        ),
                      ),
                    ],
                  )
                ],
                  ),
                  ),
              ),
            ],
          ),
        ],
      ),

    );
  }
  void _onEntryAdded(Event event) {
    setState(() {
      boardMessgae.add(Board2.fromSnapshot(event.snapshot));
    });
  }

  handleAdd() {
    final FormState form=formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      dbRef.child("Teacher").child(board.teacherId).set(board.toJason());
    }
  }



  handleRemove() {
    final FormState form=formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      dbRef.child("Teacher").child(board.teacherId).remove();
    }


  }
}


//*****************************************************************************************************************

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
}
