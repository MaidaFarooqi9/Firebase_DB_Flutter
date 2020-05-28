
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Furniture"),
        backgroundColor: Colors.pinkAccent,),
      drawer:Drawer(child:ListView(
        padding:EdgeInsets.all(4.0),
        children: <Widget>[
          DrawerHeader(
            child:
            Text('Furniture Items',
                style:new TextStyle(
                  color:Colors.pink,
                  fontSize:23,
                  backgroundColor: Colors.lightGreen,
                )),

          ),
          ListTile(
            title:Text('Living Room',
              style:new TextStyle(
                color:Colors.green,
                fontSize:21,

              ),) ,
            onTap:(){

              Navigator.pushNamed(context,'/LR');},
          ),
          ListTile(
            title:Text('Drawing Room',
              style:new TextStyle(
                color:Colors.green,
                fontSize:21,

              ),) ,
          ),
          ListTile(
              title:Text('Bed Room',
                style:new TextStyle(
                  color:Colors.green,
                  fontSize:11,
                ),) ,
              onTap:(){
                Navigator.pushNamed(context,'/BR');
              }
          ),
        ],
      ),),

    );}
}






/* if you want to add tabBar

return DefaultTabController(length: 3,child: Scaffold(
  appBar: AppBar(
    bottom: new TabBar(tabs:
    [new Tab(text:"Wooden Stuff"),
      new Tab(text:"Leather Stuff"),
      new Tab(text:"Location")]),

  ),
  body:TabBarView(children: <Widget>[
    Wooden(),
    Leather(),
    Location(),
  ],)

),
);
  }
}

class Wooden extends StatefulWidget {
  @override
  _WoodenState createState() => _WoodenState();

}

class _WoodenState extends State<Wooden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
  Image.asset('assets/wtable.png',height:60,width:80),
  Image.asset('assets/wf1.jpg',height: 60,width: 90,),
  Image.asset('assets/wf2.jpg',height: 60,width: 80,),
],
      )
    );
  }
}


class Leather extends StatefulWidget {
  @override
  _LeatherState createState() => _LeatherState();

}

class _LeatherState extends State<Leather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text('hello'),
      ),
    );
  }
}

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
*/
