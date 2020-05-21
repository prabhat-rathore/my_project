import'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class SecondScreen extends StatefulWidget {
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

//*************************************************************************************************

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
                    child: Text("View Attendance"),
                    color: Colors.yellow,
                  ),
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
//String s;
  void readData() {
    dbRef.once().then((DataSnapshot dataSnapshot){
      print(dataSnapshot.value["Student"]);

    });
  }
}

//*************************************************************************************


class SecondScreenSign extends StatefulWidget {
  _SecondScreenSignState createState() => _SecondScreenSignState();
}

class _SecondScreenSignState extends State<SecondScreenSign> {
  final dbRef = FirebaseDatabase.instance.reference();
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmPassword=TextEditingController();
  final TextEditingController _usnController=TextEditingController();
  String password;
  String confirm_password;
  String usn;
  Widget _buildUsn(){
    padding:const EdgeInsets.all(10.0);
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter your usn",
        labelText: "usn",
      filled: true,
          fillColor: Colors.grey[200],
      contentPadding: const EdgeInsets.all(13.0)),
      controller: _usnController,
      onSaved: (String val){
        usn=val;
      },

      validator: (String val){
        String s;
        dbRef.once().then((DataSnapshot dataSnapshot){
          s=dataSnapshot.value["Student"][_usnController.text];
        });
        if(val.isEmpty){
          return "USN is required";
        }
        //if(_usn)
        return null;
      }
    );
  }
  Widget _buildPassword(){
    padding:const EdgeInsets.all(10.0);
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.all(13.0),
      ),
      controller: _password,
      onSaved: (String val)
      {
        password=val;
      },
      validator: (String val){
        if(val.isEmpty){
          return "Password is required";
        }
        if(val.length<7){
          return "Password should be minimum of 7 character";
        }
        return null;
      },
      obscureText: true,
    );
  }
  Widget _buildConfirmPassword(){
    padding:const EdgeInsets.all(10.0);
    return TextFormField(
          decoration: InputDecoration(
            hintText: "Confirm Password",
            filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.all(13.0)
          ),
      obscureText: true,
      controller: _confirmPassword,
      validator: (String value)
      {
            if(value.isEmpty){
              return "Enter confirm password";
            }
            if(value!=_password.text){
              return "Password does not match";
            }
            return null;
      },
      onSaved: (String value){
        confirm_password=value;
      },

      );
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      //backgroundColor: Colors.blueGrey,
      body:ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildUsn(),
                  _buildPassword(),
                  _buildConfirmPassword(),
                  SizedBox(height: 30.0,),
                  RaisedButton(
                      onPressed: (){
                        handleSubmit();
                      },
                  child: Text("Submit"),
                  color: Colors.yellow,)
                ],
              ),
            ),
          ),
        ],
      ),
    );}

  void handleSubmit() {
    final FormState form=_formKey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      //dbRef.child("Student").child(board.usn).set(board.toJason());
    }
  }
}
