import 'package:notes_json_app/domain/enteties/note.dart';

class NoteModel extends NoteEntity {
  const NoteModel({
    String? text,
    String? dateTime,
  }) : super(
          text: text,
          dateTime: dateTime,
        );

  factory NoteModel.fromJson(Map<String, dynamic> map) {
    return NoteModel(
      text: map["title"] ?? "",
      dateTime: map["title"] ?? "",
    );
  }

  factory NoteModel.fromEntity(NoteEntity noteEntity) {
    return NoteModel(
      text: noteEntity.text,
      dateTime: noteEntity.dateTime,
    );
  }
}
