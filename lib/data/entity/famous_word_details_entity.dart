import '../Model/famous_word_details_model.dart';

class FamousWordDetailsEntity {
  String title;
  String image;
  String contentDescription;

  FamousWordDetailsEntity(
      {required this.image,
      required this.title,
      required this.contentDescription});

  factory FamousWordDetailsEntity.fromJSON(Map<String, dynamic> jsonData) {
    String title = jsonData['title'];
    String contentDescription = jsonData['content_description'];
    String image = jsonData['url'];
    return FamousWordDetailsEntity(
        title: title, image: image, contentDescription: contentDescription);
  }

  factory FamousWordDetailsEntity.fromSpecifSearchResponseJSON(
      Map<String, dynamic> jsonData) {
    String title = jsonData['title'];
    String contentDescription = jsonData['content_description'];
    Map<String, dynamic> mediaFormats = jsonData['media_formats'];
    String image = mediaFormats['gif']['url'];
    return FamousWordDetailsEntity(
        title: title, image: image, contentDescription: contentDescription);
  }

  FamousWordDetailsModel toModel() {
    return FamousWordDetailsModel(
        title: title, image: image, contentDescription: contentDescription);
  }
}
