import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/model/boxes.dart';
import 'package:note_hive/screens/contents.dart';
import 'package:note_hive/widget/note_tile.dart';
import 'package:hive/hive.dart' as hive;

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
              const Icon(
                Icons.menu_outlined,
                size: 50,
              ),
              const Text(
                'Notes',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check_box,
                    size: optionIconSize,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.search, size: optionIconSize),
                  Icon(Icons.more_vert_sharp, size: optionIconSize)
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Expanded(
                child: FutureBuilder(
                    future: hive.Hive.openBox('noteBox'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ValueListenableBuilder(
                            valueListenable: notesBox.listenable(),
                            builder: (context, Box box, widget) {
                              return ListView.separated(
                                itemCount: box.length,
                                itemBuilder: (context, index) {
                                  final note = box.getAt(index);
                                  String tit = note.title;
                                  String con = note.content;
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => Content(
                                                  title: tit,
                                                  content: con,
                                                  index: index)));
                                    },
                                    child: NoteTile(
                                      title: note.title ?? 'title',
                                      subtitle: note.content ?? 'content',
                                      date: note.date ?? 'date',
                                      delete: () {
                                        box.deleteAt(index);
                                      },
                                      // edit: (){
                                      //     Navigator.push(context, MaterialPageRoute(builder: (c) => Content()));
                                      // },
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('no data'),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Content()));
          },
          backgroundColor: const Color(0xffC99180),
          child: const Icon(Icons.add, size: 35),
        ),
      ),
    );
  }
}
