class AzkarListModel {
  int? dhikrId;
  List<Azkar>? azkar;

  AzkarListModel({this.dhikrId, this.azkar});

  AzkarListModel.fromJson(Map<String, dynamic> json) {
    dhikrId = json['dhikr_id'];
    if (json['azkar'] != null) {
      azkar = <Azkar>[];
      json['azkar'].forEach((v) {
        azkar!.add(Azkar.fromJson(v));
      });
    }
  }
}

class Azkar {
  int? id;
  int? idNumber;
  int? idFav;
  String? name;
  List<AzkarBody>? azkarBody;

  Azkar({this.id, this.idNumber, this.idFav, this.name, this.azkarBody});

  Azkar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idNumber = json['id_number'];
    idFav = json['id_fav'];
    name = json['name'];
    if (json['azkar_body'] != null) {
      azkarBody = <AzkarBody>[];
      json['azkar_body'].forEach((v) {
        azkarBody!.add(AzkarBody.fromJson(v));
      });
    }
  }
}

class AzkarBody {
  int? id;
  int? num;
  String? body;
  String? description;
  int? count;
  int? value;

  AzkarBody(
      this.id, this.num, this.body, this.description, this.count, this.value);

  AzkarBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    body = json['body'];
    description = json['description'];
    count = json['count'];
    value = json['value'];
  }
}
