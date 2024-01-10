
import 'package:flutter/material.dart';
import 'package:note_hive/widget/note_tile.dart';

const double optionIconSize = 28;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.menu_outlined, size: 50,),
              Text('Notes',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.check_box,size: optionIconSize,),
                  SizedBox(width: 5,),
                  Icon(Icons.search, size: optionIconSize),
                  Icon(Icons.more_vert_sharp, size: optionIconSize)
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                      itemBuilder: (context, index){
                        return NoteTile(
                            title: "l;asdkfj",
                            subtitle: 'asd;lfj',
                            date: "$index");
                      },
                  separatorBuilder: (context, index){
                      return SizedBox(
                        height: 10,
                      );
                  },

                  ),

              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){},
        child: Icon(Icons.add, size: 35),
          backgroundColor: Color(0xffC99180),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items:[ 
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
              label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder_outlined),
                label: "Folders"
              )
            ]),
      ),
    );
  }
}
