import 'package:hive/hive.dart';
import 'package:notes_json_app/domain/enteties/note.dart';
part 'note_hive_model.g.dart';

@HiveType(typeId: 0)
class NoteHiveModel extends HiveObject {
  @HiveField(0)
  String? text;

  @HiveField(1)
  String? dateTime;

  NoteHiveModel({
    this.text,
    this.dateTime,
  });

  factory NoteHiveModel.fromEntity(NoteEntity noteEntity) {
    return NoteHiveModel(
      text: noteEntity.text,
      dateTime: noteEntity.dateTime,
    );
  }

  NoteEntity toEntity({String? text, String? dateTime}) {
    return NoteEntity(
      text: text ?? this.text,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
