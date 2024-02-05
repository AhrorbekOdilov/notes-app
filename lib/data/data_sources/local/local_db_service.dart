import 'package:hive_flutter/adapters.dart';
import 'package:notes_json_app/data/data_sources/local/models/note_hive_model.dart';

class LocalDBService {
  static const String boxkey = "notes";
  static Box<NoteHiveModel> box = Hive.box(boxkey);

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteHiveModelAdapter());
    await Hive.openBox<NoteHiveModel>(boxkey);
  }

  List<NoteHiveModel> getSavedNotes() {
    return box.values.toList();
  }

  Future<void> saveNote(NoteHiveModel noteHiveModel) async {
    print("Note saved");

    await box.put(noteHiveModel.dateTime, noteHiveModel);
  }

  Future<void> removeNote(NoteHiveModel noteHiveModel) async {
    await box.delete(noteHiveModel.dateTime);
  }
}
