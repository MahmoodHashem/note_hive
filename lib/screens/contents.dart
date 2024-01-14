

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  final title = TextEditingController();
  final content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back, size: 40,)),
                Icon(Icons.bookmark_border_outlined, size: 35,),

              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: title,
              maxLines: 1,
              maxLength: 50,

              cursorHeight: 40,
              cursorColor: Color(0xffC99180),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 35
                )
              ),
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              ),
            SizedBox(
              height: 15,
            ),
            Text(DateTime.now().toString(),
              style:const TextStyle(
                color: Color(0xffC99180),
                fontSize: 12
              ) ,),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
               
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 18),
                child: SingleChildScrollView(
                 // reverse: true,
                  child: TextField(
                    controller: content,
                    cursorHeight: 20,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'contents...'
                    ),
                    cursorColor: const Color(0xffC99180),
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                  ),

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(onPressed: (){

                  final newNote = Note(title: title.text,  content: content.text, date: DateTime.now().toString());
               
                  notesBox.add(newNote);

                  Navigator.pop(context);
                }, child: Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                MaterialButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Cancel", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
