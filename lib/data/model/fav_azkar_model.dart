class FavAzkarListModel {
  int? id;
  String? number;
  int? idFav;
  String? name;
  List<AzkarBodyF>? azkarBody;

  FavAzkarListModel(
      this.id, this.name, this.number, this.idFav, this.azkarBody);

  FavAzkarListModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    name = json["name"];
    idFav = json["id_fav"];
    if (json['azkar_body'] != null) {
      azkarBody = <AzkarBodyF>[];
      json['azkar_body'].forEach((v) {
        azkarBody!.add(AzkarBodyF.fromJson(v));
      });
    }
  }
}

class AzkarBodyF {
  int? id;
  int? num;
  String? body;
  String? description;
  int? count;
  AzkarBodyF(this.id, this.num, this.body, this.description, this.count);

  AzkarBodyF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    body = json['body'];
    description = json['description'];
    count = json['count'];
  }
}
