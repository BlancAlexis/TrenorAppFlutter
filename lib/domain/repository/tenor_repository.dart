import 'package:tenor/data/Model/category_model.dart';
import 'package:tenor/data/Model/famous_word_details_model.dart';
import 'package:tenor/data/Model/famous_word_model.dart';

abstract class TenorRepository {
  Future<List<CategoryModel>> getAllGifCategory();

  Future<List<FamousWordModel>> getAllFamousWord();

  Future<List<FamousWordDetailsModel>> getDetailsAboutFamousWord(String query);

  Future<List<FamousWordDetailsModel>> getNextDetailsAboutFamousWord(
      String query);
}
