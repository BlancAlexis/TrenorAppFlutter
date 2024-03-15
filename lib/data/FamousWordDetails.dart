class FamousWordDetailsModel {
  String title;
  String image;
  String contentDescription;

  FamousWordDetailsModel({ required this.image , required this.title, required this.contentDescription});

}
class FamousWordDetailsEntity {
  String title;
  String image;
  String contentDescription;

  FamousWordDetailsEntity({ required this.image , required this.title, required this.contentDescription});

  factory FamousWordDetailsEntity.fromJSON(Map<String, dynamic> jsonData) {
    String title = jsonData['title'];
    String contentDescription = jsonData['content_description'];
    String image = jsonData['image'];
    return FamousWordDetailsEntity(title: title, image: image, contentDescription : contentDescription);
  }

  FamousWordDetailsModel toModel() {
    return FamousWordDetailsModel(title: title,image: image, contentDescription: contentDescription);
  }
}