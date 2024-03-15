import 'dart:convert';

import 'package:tenor/data/CategoryModel.dart';
import 'package:tenor/data/FamousWord.dart';
import 'package:tenor/data/FamousWordDetails.dart';
import 'package:http/http.dart' as http;
import 'package:tenor/data/FamousWordEntity.dart';
import 'package:tenor/data/tenor_endpoint.dart';

abstract class getTenorRepo {
  Future<List<CategoryModel>> getAllGifCategory();
  Future<List<FamousWordModel>> getAllFamousWord();
  Future<List<FamousWordDetails>> getDetailsAboutFamousWord();
}
const apiKey = String.fromEnvironment('TENOR_API_KEY', defaultValue: 'clef_default');

class getTenorRepoImpl extends getTenorRepo{

  @override
  Future<List<CategoryModel>> getAllGifCategory() {
    // TODO: implement getAllGifCategory
    throw UnimplementedError();
  }

  @override
  Future<List<FamousWordModel>> getAllFamousWord() async {
  return (await TenorEndpointImpl().getAllFamousWord()).map((e) => e.toModel()).toList();


  }

  @override
  Future<List<FamousWordDetails>> getDetailsAboutFamousWord() {
    // TODO: implement getDetailsAboutFamousWord
    throw UnimplementedError();
  }

}