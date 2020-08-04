import 'package:flutter/material.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            height: 220,
            width:double.infinity,
            padding:EdgeInsets.all(10),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 18,),
                CircleAvatar(
                  backgroundImage:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTcaDRnvXQcSC1BZYjBvtrZKnrSkQ9EuS9BFw_ma0dEY1XIEC5w&usqp=CAU"),
                  radius: 60,
                ),
                SizedBox(height:15),
                Text(
                  "Cookin Up!",
                  style:TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize:30,
                    color:Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:20,
          ),
          ListTile(
            leading: Icon(Icons.restaurant,size: 26,),
            title: Text("meals",style:TextStyle(fontWeight:FontWeight.w400)),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,size: 26,),
            title: Text("settings",style:TextStyle(fontWeight:FontWeight.w400)),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/filters_screen');
            },
          ),
        ],
      ),
    );
  }
}