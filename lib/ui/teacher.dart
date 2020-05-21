import 'package:dropdownapp/model/board.dart';
import'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:validators/validators.dart' as validator;
class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  var _nameFieldController2 = TextEditingController();
  var _passwordFieldController2 = TextEditingController();

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


//***************************************************************************************************



class ThirdScreenSign extends StatefulWidget {
  @override
  _ThirdScreenSignState createState() => _ThirdScreenSignState();
}

class _ThirdScreenSignState extends State<ThirdScreenSign> {
  final dbRef = FirebaseDatabase.instance.reference();
  String firstname;
  String lastname;
  bool  email;
  bool password;

  //String s2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),);
  }}














//*******************************************************************************************************************





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
  }}

//***********************************************************************************************************

class ThirdScreenAddRemove extends StatefulWidget{
  _ThirdScreenAddRemoveState createState()=>_ThirdScreenAddRemoveState();
}
class _ThirdScreenAddRemoveState extends State<ThirdScreenAddRemove>{
  final dbRef=FirebaseDatabase.instance.reference();
   List<Board> boardMessgae=List();
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
       boardMessgae.add(Board.fromSnapshot(event.snapshot));
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








