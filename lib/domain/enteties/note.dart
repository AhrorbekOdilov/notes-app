import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final String? text;
  final String? dateTime;

  const NoteEntity({
    this.text,
    this.dateTime,
  });

  @override
  List<Object?> get props => [text, dateTime];
}
