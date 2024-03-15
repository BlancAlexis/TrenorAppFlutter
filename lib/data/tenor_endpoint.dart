import 'dart:convert';

import 'CategoryModel.dart';
import 'FamousWordDetails.dart';
import 'FamousWordEntity.dart';
import 'package:http/http.dart' as http;

// Register pour l'abstraction di
class TenorEndpointImpl extends TenorEndpoint {
  @override
  Future<List<FamousWordEntity>> getAllFamousWord() async{
    final httpPackageResponse = await http.get(Uri.parse('https://g.tenor.com/v2/trending_terms?key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
   return (valueDecode["results"] as List).map((value) => FamousWordEntity(famousWord: value)).toList();
  }

  @override
  Future<List<CategoryEntity>> getAllGifCategory() async {
    final httpPackageResponse = await http.get(Uri.parse('https://g.tenor.com/v2/categories?key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    return (valueDecode["tags"] as List).map((value) => CategoryEntity.fromJSON(value)).toList();
  }

  @override
  Future<List<FamousWordDetailsEntity>> getDetailsAboutFamousWord(String query) async {
    final httpPackageResponse = await http.get(Uri.parse('https://g.tenor.com/v2/search?q=$query&key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    return (valueDecode["results"] as List).map((value) => FamousWordDetailsEntity.fromJSON(value)).toList();
  }

}
abstract class TenorEndpoint {
  Future<List<FamousWordEntity>> getAllFamousWord();
  Future<List<CategoryEntity>> getAllGifCategory();
  Future<List<FamousWordDetailsEntity>> getDetailsAboutFamousWord(String query);
}