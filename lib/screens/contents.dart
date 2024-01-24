import 'package:flutter/material.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/note.dart';
import 'package:intl/intl.dart' as dateFormat;
import 'package:note_hive/widget/text_field.dart';
import 'package:auto_direction/auto_direction.dart';


class Content extends StatefulWidget {
  const  Content({Key? key, this.title, this.content, this.index, this.isFavorite}) : super(key: key);

  final String? title;
  final String? content;
  final int? index;
  final bool? isFavorite;


  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  late FocusNode specialFocusNode;
  bool isSelected = false;
  @override
  void initState() {
    //create the FocusNode as soon as the page is created
    super.initState();
    specialFocusNode = FocusNode();

    if(widget.title != null && widget.content != null){
      title.text = widget.title!;
      content.text = widget.content!;
      isSelected = widget.isFavorite!;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    specialFocusNode.dispose();
  }

  final title = TextEditingController();
  final content = TextEditingController();



  final createdDate = dateFormat.DateFormat('h:mm a, d MMMM y').format(DateTime.now());


   bool isRTL = false;
  String titleText = "";
  String contentText = "";

  bool isFocused = false;



  @override
  Widget build(BuildContext context) {

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
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          if(!isSelected){
                            isSelected = true;
                            final newNote = Note(title: title.text,  content: content.text, date: createdDate, isFavorite: isSelected);

                            if(widget.title != null && widget.content != null) {
                              savedNote.putAt(widget.index!, newNote);
                            }else{
                              savedNote.add(newNote);
                            }
                          }else{
                            isSelected =false;
                          }
                        });

                      },
                      child: Icon(
                        isSelected? Icons.favorite : Icons.favorite_border,
                        size: 35,color: isSelected? Colors.red: Colors.grey,)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
             AutoDirection(
               text: titleText,
               onDirectionChange: (isRtl){
                  setState(() {
                    isRTL = isRtl;
                  });
               },
               child: AppTextField(
                 onChanged: (src){
                   setState(() {
                     titleText = src;
                   });
                 },
                   autoFocus: true,
                   size: 30,
                   hint: 'Title',
                   controller: title,
                   textInput: TextInputType.multiline),
             ),
              const SizedBox(
                height: 15,
              ),
              Text(createdDate,
                style:const TextStyle(
                  color: Color(0xffC99180),
                  fontSize: 12
                ) ,),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      specialFocusNode.requestFocus();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(bottom: 18),
                    child: SingleChildScrollView(
                     // reverse: true,
                      child: AutoDirection(
                        text:contentText,
                        onDirectionChange: (isRtl){
                          setState(() {
                                  isRTL = isRtl;
                                });
                        },
                        child: AppTextField(
                          onChanged: (src){
                            setState(() {
                             contentText = src;
                             print(contentText);
                            });
                          },
                            size: 18,
                          focusNode: specialFocusNode,
                            hint: 'Contents...',
                           controller: content,
                            textInput: TextInputType.multiline,
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(onPressed: (){

                    final newNote = Note(title: title.text,  content: content.text, date: createdDate, isFavorite:isSelected);

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
