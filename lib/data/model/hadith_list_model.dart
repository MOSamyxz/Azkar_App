class HadithListModel {
  int? id;
  String? number;
  int? hadithNumber;
  String? name;

  HadithListModel(this.id, this.name, this.number, this.hadithNumber);

  HadithListModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    number = json["number"];
    name = json["name"];
    hadithNumber = json["hadith_number"];
  }
}
