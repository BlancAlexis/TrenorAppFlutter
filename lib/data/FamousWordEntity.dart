import 'package:tenor/data/FamousWord.dart';

class FamousWordEntity{
  String famousWord;

  FamousWordEntity({required this.famousWord});

  FamousWordModel toModel() {
    return FamousWordModel(famousWord: famousWord);
  }
}