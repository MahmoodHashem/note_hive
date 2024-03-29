
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Note {

  Note({required this.title, required this.content, required this.date});

  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  String date;
}