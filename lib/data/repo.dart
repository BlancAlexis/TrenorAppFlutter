import 'dart:convert';

import 'package:tenor/data/CategoryModel.dart';
import 'package:tenor/data/FamousWord.dart';
import 'package:tenor/data/FamousWordDetails.dart';
import 'package:http/http.dart' as http;
import 'package:tenor/data/FamousWordEntity.dart';

abstract class getTenorRepo {
  Future<List<CategoryModel>> getAllGifCategory();
  Future<Map<String, dynamic>> getAllFamousWord();
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
  Future<Map<String, dynamic>> getAllFamousWord() async {
    final httpPackageResponse = await http.get(Uri.parse('https://g.tenor.com/v2/trending_terms?key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return {};
    }
   Map<String, dynamic>.from(json.decode(httpPackageResponse.body))["results"].forEach((key, value) {
     FamousWordEntity(famousWord: value);
   });


  }

  @override
  Future<List<FamousWordDetails>> getDetailsAboutFamousWord() {
    // TODO: implement getDetailsAboutFamousWord
    throw UnimplementedError();
  }

}