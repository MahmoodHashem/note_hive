

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 15,),
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight:Radius.circular(20),bottomRight: Radius.circular(20))
        ),
        child: Column(
          children: [
            DrawerHeader(child: Center(child: Text("MNote", style: TextStyle(fontSize: 40),))),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5),
              child: Card(
                color:  Color(0xffC99180),
                child: ListTile(
                  leading: Icon(Icons.bookmark_added, color: Colors.black,),
                  title: Text("My Notes"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 10, left: 5),
              child: Card(
                color:  Color(0xffC99180),
                child: ListTile(
                  leading: Icon(Icons.share, color: Colors.black,),
                  title: Text("Share"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 5),
              child: Card(
                color:  Color(0xffC99180),
                child: ListTile(
                  leading: Icon(Icons.settings_outlined, color: Colors.black,),
                  title: Text("Settings"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 10,left: 5),
              child: Card(
                color:  Color(0xffC99180),
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.black,),
                  title: Text("About"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( bottom: 10,left: 5),
              child: Card(
                color:  Color(0xffC99180),
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.black,),
                  title: Text("Exit"),
                ),
              ),
            ),
          ],
        )
    );
  }
}
