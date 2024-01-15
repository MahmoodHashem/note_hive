import 'package:flutter/material.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';
import 'package:intl/intl.dart';

class Content extends StatefulWidget {
   const Content({Key? key, this.title, this.content, this.index}) : super(key: key);

  final String? title;
  final String? content;
  final int? index;


  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  final title = TextEditingController();
  final content = TextEditingController();
  final date = TextEditingController();

final dateCreated = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {

    if(widget.title != null && widget.content != null){
      title.text = widget.title!;
      content.text = widget.content!;
    }

    return SafeArea(
      child: Scaffold(
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
                  }, icon: const Icon(Icons.arrow_back, size: 40,)),
                  const Icon(Icons.bookmark_border_outlined, size: 35,),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                controller: title,
                maxLines: 1,
                maxLength: 50,
                cursorHeight: 40,
                cursorColor: const Color(0xffC99180),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 35
                  )
                ),
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                ),
              const SizedBox(
                height: 15,
              ),
              Text(dateCreated,
                style:const TextStyle(
                  color: Color(0xffC99180),
                  fontSize: 12
                ) ,),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 18),
                  child: SingleChildScrollView(
                   // reverse: true,
                    child: TextField(
                      controller: content,
                      cursorHeight: 20,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contents...',
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


                    final newNote = Note(title: title.text,  content: content.text, date: DateFormat.yMMMEd().format(DateTime.now()));

                    if(widget.title != null && widget.content != null) {
                      notesBox.putAt(widget.index!, newNote);
                    }else{
                      notesBox.add(newNote);
                    }


                    Navigator.pop(context);
                  }, child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
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
      ),
    );
  }
}
