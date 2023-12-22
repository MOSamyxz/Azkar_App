class AzkarCategoryListModel {
  int? id;
  int? number;
  String? name;
  String? image;

  AzkarCategoryListModel(this.id, this.name, this.number, this.image);

  AzkarCategoryListModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    name = json["name"];
    image = json["image"];
  }
}
