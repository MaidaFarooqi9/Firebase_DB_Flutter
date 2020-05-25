import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureshop/SecondPage.dart';
import 'register.dart';
import 'auth.dart';
import 'routes.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formkey=GlobalKey<FormState>();
  AuthService _auth=AuthService();
  //Register r=Register();

  String email=" ";
  //email=r.createState();
  String password=" ";
  String error=" ";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar:AppBar(title: Text("Login"),
                    backgroundColor: Colors.pinkAccent,),

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
            children:<Widget>
            [
              Text('Username' ,
                  style: new TextStyle(
                    color:Colors.black ,
                    fontSize: 30.0,
                    backgroundColor: Colors.pink,)
              ),

              Padding(
                padding:const EdgeInsets.all(8.0),

                child:
                TextFormField(
                  //validator: (val)=>val=val.isEmpty?'Enter valid email':null,
                    onChanged:(val){
                    setState(()=>email=val);{

                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter your username'
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
                TextFormField(
                //  validator: (val)=>val=val.length<=6?null:'password should not be greater than 5',
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

              FlatButton( splashColor:Colors.pinkAccent,highlightColor:Colors.yellowAccent,onPressed: () async {
                   //if(_formkey.currentState.validate()){
                    dynamic result= await _auth.signInEmailAndPass(email,password);
                //dynamic result= await _auth.signInEmailAndPassword(email, password);
                     if(result==null){
                       setState(()=>error="not a registered user");
                }
                     else{
                       Navigator.pushNamed(context,'/SecondPage');
                     }
                  //}

              },
                // icon: Icon(Icons.assignment_turned_in),
                child:Text('SignIn'),

              ),

              Text(error,
              style: new TextStyle(color:Colors.red),),

              Text('No account?,sign up here', style: new TextStyle(color:Colors.red),),
              FlatButton( splashColor:Colors.pinkAccent,highlightColor:Colors.yellowAccent,onPressed: (){
                Navigator.pushNamed(context, '/RegisterPage');
              },

                child:Text('SignUp'),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
