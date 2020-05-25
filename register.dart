import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth.dart';
import 'routes.dart';
import 'package:furnitureshop/main.dart';
class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();


}

class _RegisterState extends State<Register> {
  final _formkey=GlobalKey<FormState>();
  AuthService _auth=AuthService();
  String email=" ";
   String password=" ";
  String error=" ";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(title: Text("Sign Up"),),

      body:Container(
        decoration:BoxDecoration(
          image:DecorationImage(
            //image:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSGBu2B9Q2vkY7ZujovEz9AWysHLF5P4aXmROWcSj2fANHGTMie&usqp=CAU'),
            image: NetworkImage('https://images.fineartamerica.com/images-medium-large-5/2-grey-and-brown-abstract-art-painting-carollynn-tice.jpg'),

          ),
        ),
//mainAxisAlignment:MainAxisAlignment.center,
        //      crossAxisAlignment: CrossAxisAlignment.center,

//children: <Widget>[
        child:Form(
          key:_formkey,
          child:Column(
            children:<Widget>[
              Text('Email' ,
                  style: new TextStyle(
                    color:Colors.black ,
                    fontSize: 30.0,
                    backgroundColor: Colors.pink,)
              ),

              Padding(
                padding:const EdgeInsets.all(8.0),

                child:
                TextFormField(
                  validator: (val)=>val=val.isEmpty?'Enter valid email':null,
                  onChanged:(val){
                    setState(()=>email=val);{

                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter email'
                  ),
                ),
              ),
              Text('Password' ,
                  style: new TextStyle(
                    color:Colors.black ,
                    fontSize: 30.0,
                    backgroundColor: Colors.pink,)
              ),

              Padding(
                padding:const EdgeInsets.all(8.0),
                child:
                TextFormField(validator: (val)=>val=val.length<=6?null:'password should not be greater than 6',
                  onChanged:(val){
                    setState(()=>password=val);{

                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Enter password'
                  ),
                ),
              ),

              Text('Phone #',
                  style: new TextStyle(
                    color:Colors.black ,
                    fontSize: 30.0,
                    backgroundColor: Colors.pink,)),

              TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              ),
              FlatButton( splashColor:Colors.pinkAccent,highlightColor:Colors.yellowAccent,onPressed: () async {
                bool enabled=false;
                setState(() {
                  enabled=false;
                });
                   if(_formkey.currentState.validate()){
                     setState(() {
                       enabled=true;
                     });
                      dynamic result= await _auth.registerWithEmailAndPassword(email, password);
                          if(result==null){

                              setState(()=>error="Fields are empty");
                                          }
                          else{
                            Navigator.pushNamed(context, '/');
                          }
                   }


              },
                // icon: Icon(Icons.assignment_turned_in),
                child:Text('Register'),


              ),
              FlatButton( splashColor:Colors.pinkAccent,highlightColor:Colors.yellowAccent,onPressed: (){
                //Navigator.pop(context);
                Navigator.pushNamed(context,'/');
              },

                child:Text('Back'),

              ),
              Text(error,
                style: new TextStyle(color:Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}
