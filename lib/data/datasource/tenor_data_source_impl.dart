// Register pour l'abstraction di

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tenor/data/datasource/tenor_data_source.dart';

import '../Entity/category_entity.dart';
import '../Entity/famous_word_details_entity.dart';
import '../Entity/famous_word_entity.dart';

class TenorDataSourceImpl extends TenorDataSource {
  @override
  Future<List<FamousWordEntity>> getAllFamousWord() async {
    final httpPackageResponse = await http.get(Uri.parse(
        'https://g.tenor.com/v2/trending_terms?key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    return (valueDecode["results"] as List)
        .map((value) => FamousWordEntity(famousWord: value))
        .toList();
  }

  @override
  Future<List<CategoryEntity>> getAllGifCategory() async {
    final httpPackageResponse = await http.get(Uri.parse(
        'https://g.tenor.com/v2/categories?key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    return (valueDecode["tags"] as List)
        .map((value) => CategoryEntity.fromJSON(value))
        .toList();
  }

  @override
  Future<List<FamousWordDetailsEntity>> getDetailsAboutFamousWord(
      String query) async {
    final httpPackageResponse = await http.get(Uri.parse(
        'https://g.tenor.com/v2/search?q=$query&key=AIzaSyD3U57ytKdya6GPPGspReBnXNdjobSQLJc'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    return (valueDecode["results"] as List)
        .map((value) => FamousWordDetailsEntity.fromJSON(value))
        .toList();
  }
}
