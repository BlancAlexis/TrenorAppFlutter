// Register pour l'abstraction di

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tenor/data/datasource/tenor_data_source.dart';

import '../Entity/category_entity.dart';
import '../Entity/famous_word_details_entity.dart';
import '../Entity/famous_word_entity.dart';

class TenorDataSourceImpl extends TenorDataSource {
  static const tenorApiKey = String.fromEnvironment('TENOR_API_KEY');
  static const baseUrl = "https://g.tenor.com";
  static const maxLimit = 10;
  static String nextPage = "";

  @override
  Future<List<FamousWordEntity>> getAllFamousWord() async {
    if (checkIfApiKeyIsEmpty()) {
      return List.empty();
    }
    final httpPackageResponse = await http
        .get(Uri.parse('$baseUrl/v2/trending_terms?key=$tenorApiKey'));
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
    if (checkIfApiKeyIsEmpty()) {
      return List.empty();
    }
    final httpPackageResponse =
        await http.get(Uri.parse('$baseUrl/v2/categories?key=$tenorApiKey'));
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
  Future<List<FamousWordDetailsEntity>> getSpecificGifWithString(
      String query) async {
    if (checkIfApiKeyIsEmpty()) {
      return List.empty();
    }
    final httpPackageResponse = await http.get(Uri.parse(
        '$baseUrl/v2/search?q=$query&key=$tenorApiKey&limit=$maxLimit'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    nextPage = valueDecode['next'];
    return (valueDecode["results"] as List)
        .map((value) =>
            FamousWordDetailsEntity.fromSpecifSearchResponseJSON(value))
        .toList();
  }

  @override
  Future<List<FamousWordDetailsEntity>> getNextDetailsAboutFamousWord(
      String query) async {
    if (checkIfApiKeyIsEmpty()) {
      return List.empty();
    }
    final httpPackageResponse = await http.get(Uri.parse(
        '$baseUrl/v2/search?q=$query&key=$tenorApiKey&limit=$maxLimit&pos=$nextPage'));
    if (httpPackageResponse.statusCode != 200) {
      print('Failed to retrieve the http package!');
      return List.empty();
    }
    Map<String, dynamic> valueDecode = json.decode(httpPackageResponse.body);
    nextPage = valueDecode['next'];
    return (valueDecode["results"] as List)
        .map((value) =>
            FamousWordDetailsEntity.fromSpecifSearchResponseJSON(value))
        .toList();
  }

  bool checkIfApiKeyIsEmpty() {
    if (tenorApiKey.isEmpty) {
      print('API KEY is empty');
      return true;
    }
    return false;
  }
}
