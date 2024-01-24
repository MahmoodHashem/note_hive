

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/widget/note_tile.dart';


class MyNotes extends StatefulWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Center(child: Text(
                "Saved", style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),)),

              ValueListenableBuilder(
                  valueListenable: savedNote.listenable(),
                  builder: (context,Box box,widget){
                        return ListView.builder(
                          itemCount: box.values.length,
                            itemBuilder: (context,index){
                              final note = box.getAt(index);
                              return NoteTile(
                                  title: note.title,
                                  subtitle: note.content,
                                  date: note.date,
                                  delete: (){
                                    box.deleteAt(index);
                                  });
                            }
                        );
                  })

            ]
          ),
        ),

      ),
    );
  }
}
