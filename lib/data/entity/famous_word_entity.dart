import 'package:tenor/data/Model/famous_word_model.dart';

class FamousWordEntity {
  String famousWord;

  FamousWordEntity({required this.famousWord});

  FamousWordModel toModel() {
    return FamousWordModel(famousWord: famousWord);
  }
}
