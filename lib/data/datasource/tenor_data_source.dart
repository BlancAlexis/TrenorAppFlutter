import '../Entity/category_entity.dart';
import '../Entity/famous_word_details_entity.dart';
import '../Entity/famous_word_entity.dart';

abstract class TenorDataSource {
  Future<List<FamousWordEntity>> getAllFamousWord();

  Future<List<CategoryEntity>> getAllGifCategory();

  Future<List<FamousWordDetailsEntity>> getSpecificGifWithString(String query);

  Future<List<FamousWordDetailsEntity>> getNextDetailsAboutFamousWord(
      String query);
}
