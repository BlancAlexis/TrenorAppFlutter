import 'package:tenor/domain/repository/tenor_repository.dart';

import '../../data/Model/category_model.dart';
import '../../data/Model/famous_word_details_model.dart';
import '../../data/Model/famous_word_model.dart';
import '../../data/datasource/tenor_data_source_impl.dart';

class TenorRepositoryImpl extends TenorRepository {
  @override
  Future<List<CategoryModel>> getAllGifCategory() async {
    return (await TenorDataSourceImpl().getAllGifCategory())
        .map((e) => e.toModel())
        .toList();
  }

  @override
  Future<List<FamousWordModel>> getAllFamousWord() async {
    return (await TenorDataSourceImpl().getAllFamousWord())
        .map((e) => e.toModel())
        .toList();
  }

  @override
  Future<List<FamousWordDetailsModel>> getDetailsAboutFamousWord(
      String query) async {
    return (await TenorDataSourceImpl().getSpecificGifWithString(query))
        .map((e) => e.toModel())
        .toList();
  }

  @override
  Future<List<FamousWordDetailsModel>> getNextDetailsAboutFamousWord(
      String query) async {
    return (await TenorDataSourceImpl().getNextDetailsAboutFamousWord(query))
        .map((e) => e.toModel())
        .toList();
  }
}
